#!/usr/bin/env ruby

class GearAT021 < Formula
  desc "Computational Component of Polkadot Network"
  homepage "https://github.com/gear-tech/gear"
  license "GPL-3.0-or-later"
  version "0.2.1"

  livecheck do
    url "https://get.gear.rs"
    regex(/href=.*?gear-v(\d+\.\d+\.\d+)/i)
  end

  stable do
    on_arm do
      url "https://get.gear.rs/gear-v0.2.1-aarch64-apple-darwin.tar.xz"
      sha256 "f0ad57365da3ecc483cc42fc3592afdcbcf9aac3ec0ffef36aa3878b75f6b3a0"
    end

    on_intel do
      url "https://get.gear.rs/gear-v0.2.1-x86_64-apple-darwin.tar.xz"
      sha256 "2c865a571dc4dfafa72af1b8554ec9f8603995be50eedf621a2d8002eff57042"
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
