#!/usr/bin/env ruby

class VaraAT11 < Formula
  desc "Computational Component of Polkadot Network"
  homepage "https://github.com/gear-tech/gear"
  license "GPL-3.0-or-later"
  version "0.1.1"

  livecheck do
    url "https://get.gear.rs"
    regex(/href=.*?gear-v(\d+\.\d+\.\d+)/i)
  end

  stable do
    on_arm do
      url "https://get.gear.rs/vara-testnet-v1.1-aarch64-apple-darwin.tar.xz"
      sha256 "843e51e1bc00707e04e9859522c36b277839f07a4c446bc1fe0523ec3ac5afed"
    end

    on_intel do
      url "https://get.gear.rs/vara-testnet-v1.1-x86_64-apple-darwin.tar.xz"
      sha256 "4468c774d6459dfa8bed173d19b1b7324046182d90d077f7524a902f89a45615"
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
