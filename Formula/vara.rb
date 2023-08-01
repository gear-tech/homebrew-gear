#!/usr/bin/env ruby

class Vara < Formula
  desc "Computational Component of Polkadot Network"
  homepage "https://github.com/gear-tech/gear"
  license "GPL-3.0-or-later"
  version "0.1.2"

  livecheck do
    url "https://get.gear.rs"
    regex(/href=.*?gear-v(\d+\.\d+\.\d+)/i)
  end

  stable do
    on_arm do
      url "https://get.gear.rs/vara-testnet-v1.2-aarch64-apple-darwin.tar.xz"
      sha256 "87e91ff69b0e115bfa5b8e55f8e613751588e182315ff402c7a4bc63cd9dc2f8"
    end

    on_intel do
      url "https://get.gear.rs/vara-testnet-v1.2-x86_64-apple-darwin.tar.xz"
      sha256 "e215bcf1b7ee60c185398ccbeed997df79b8747fd78d4fc7ccdbab7f12b35aa9"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink Dir["#{libexec}/gear"]
  end

  def caveats; <<~EOS

    Installed gear successfully!

    run `gear --help` to see available commands.

    EOS
  end
end
