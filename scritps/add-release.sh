#!/usr/bin/env bash

cd "$(dirname "$0")/../Formula"

FORMULA="$1"
VERSION="$2"

script_usage() {
  cat << EOF

  Usage:
    ./add-release.sh <FORMULA> <VERSION>

  Options:
    <FORMULA>      "gear" or "ethexe"
    <VERSION>      version available on https://get.gear.rs

  Example:
    ./add-release.sh gear 2.0.0
    ./add-release.sh ethexe 2.0.0
EOF
}

write_formula_file() {
  FILE_NAME=$1
  CLASS=$2

  cat <<EOF > $FILE_NAME
#!/usr/bin/env ruby

class $CLASS < Formula
  desc "Web3 Ultimate Execution Engine"
  homepage "https://github.com/gear-tech/gear"
  license "GPL-3.0-or-later"
  version "$VERSION"

  livecheck do
    url "https://get.gear.rs"
    regex(/href=.*?gear-v(\d+\.\d+\.\d+)/i)
  end

  stable do
    on_macos do
      on_arm do
        url "$LINK_MAC_ARM"
        sha256 "$SHA_MAC_ARM"
      end

      on_intel do
        url "$LINK_MAC_X86"
        sha256 "$SHA_MAC_X86"
      end
    end

    on_linux do
      on_arm do
        url "$LINK_LINUX_ARM"
        sha256 "$SHA_LINUX_ARM"
      end

      on_intel do
        url "$LINK_LINUX_X86"
        sha256 "$SHA_LINUX_X86"
      end
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink Dir["#{libexec}/$FORMULA"]
  end

  def caveats; <<~EOS

    Installed $FORMULA successfully!

    run \`$FORMULA --help\` to see available commands.

    EOS
  end
end
EOF
}

if [ "$#" -ne  "2" ]
then
    echo 'Error: Please provide <FORMULA> and <VERSION>'
    script_usage
    exit 1
fi

if [[ "$FORMULA" != "gear" ]] && [[ "$FORMULA" != "ethexe" ]]; then
    echo 'Error: <FORMULA> should be "gear" or "ethexe"'
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
FORMULA_PREFIX="$(tr '[:lower:]' '[:upper:]' <<< ${FORMULA:0:1})${FORMULA:1}"

LINK_MAC_ARM="https://get.gear.rs/$FORMULA-v$VERSION-aarch64-apple-darwin.tar.xz"
LINK_MAC_X86="https://get.gear.rs/$FORMULA-v$VERSION-x86_64-apple-darwin.tar.xz"

SHA_MAC_ARM=$(curl $LINK_MAC_ARM | shasum -a 256 | head -c 64)
SHA_MAC_X86=$(curl $LINK_MAC_X86 | shasum -a 256 | head -c 64)

LINK_LINUX_ARM="https://get.gear.rs/$FORMULA-v$VERSION-aarch64-unknown-linux-gnu.tar.xz"
LINK_LINUX_X86="https://get.gear.rs/$FORMULA-v$VERSION-x86_64-unknown-linux-gnu.tar.xz"

SHA_LINUX_ARM=$(curl $LINK_LINUX_ARM | shasum -a 256 | head -c 64)
SHA_LINUX_X86=$(curl $LINK_LINUX_X86 | shasum -a 256 | head -c 64)

write_formula_file "$FORMULA@$VERSION.rb" "${FORMULA_PREFIX}AT$SHORT_VERSION"
write_formula_file "$FORMULA.rb" "$FORMULA_PREFIX"
