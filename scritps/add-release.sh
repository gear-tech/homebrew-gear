#!/usr/bin/env bash

cd "$(dirname "$0")/../Formula"

FORMULA="$1"
VERSION="$2"

script_usage() {
  cat << EOF

  Usage:
    ./add-release.sh <FORMULA> <VERSION>

  Options:
    <FORMULA>      "gear" or "vara"
    <VERSION>      version available on https://get.gear.rs

  Example:
    ./add-release.sh gear 0.3.2
    ./add-release.sh vara 1.1
EOF
}

if [ "$#" -ne  "2" ]
then
    echo 'Error: Please provide <FORMULA> and <VERSION>'
    script_usage
    exit 1
fi

if [[ "$FORMULA" != "gear" ]] && [[ "$FORMULA" != "vara" ]]; then
    echo 'Error: <FORMULA> should be "gear" or "vara"'
    script_usage
    exit 1
fi

echo "$VERSION" | grep -Eq "^[0-9]+\.[0-9]+(\.[0-9]+)?$"

if [ $? -ne 0 ]; then
    echo '<VERSION> format is not correct'
    script_usage
    exit 1
fi

set -e

SHORT_VERSION=$(echo $VERSION | sed s/\\.//g)
FILE_NAME=$FORMULA@$VERSION.rb
FORMULA_PREFIX="$(tr '[:lower:]' '[:upper:]' <<< ${FORMULA:0:1})${FORMULA:1}"

if [[ "$FORMULA" == "vara" ]]; then
   INFIX="testnet-"
fi

LINK_MAC_ARM="https://get.gear.rs/$FORMULA-${INFIX}v$VERSION-aarch64-apple-darwin.tar.xz"
LINK_MAC_X86="https://get.gear.rs/$FORMULA-${INFIX}v$VERSION-x86_64-apple-darwin.tar.xz"

SHA_MAC_ARM=$(curl $LINK_MAC_ARM | shasum -a 256 | head -c 64)
SHA_MAC_X86=$(curl $LINK_MAC_X86 | shasum -a 256 | head -c 64)

cat <<EOF > $FILE_NAME
#!/usr/bin/env ruby

class ${FORMULA_PREFIX}AT$SHORT_VERSION < Formula
  desc "Computational Component of Polkadot Network"
  homepage "https://github.com/gear-tech/gear"
  license "GPL-3.0-or-later"
  version "$VERSION"

  livecheck do
    url "https://get.gear.rs"
    regex(/href=.*?gear-v(\d+\.\d+\.\d+)/i)
  end

  stable do
    on_arm do
      url "$LINK_MAC_ARM"
      sha256 "$SHA_MAC_ARM"
    end

    on_intel do
      url "$LINK_MAC_X86"
      sha256 "$SHA_MAC_X86"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink Dir["#{libexec}/gear"]
  end

  def caveats; <<~EOS

    Installed gear successfully!

    run \`gear --help\` to see available commands.

    EOS
  end
end
EOF
