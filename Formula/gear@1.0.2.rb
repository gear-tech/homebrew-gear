#!/usr/bin/env ruby

class GearAT102 < Formula
  desc "Computational Component of Polkadot Network"
  homepage "https://github.com/gear-tech/gear"
  license "GPL-3.0-or-later"
  version "1.0.2"

  livecheck do
    url "https://get.gear.rs"
    regex(/href=.*?gear-v(\d+\.\d+\.\d+)/i)
  end

  stable do
    on_arm do
      url "https://get.gear.rs/gear-v1.0.2-aarch64-apple-darwin.tar.xz"
      sha256 "24a86800ddcbb491e3c8d656668e0ba7a695c72655e73381f2c564ed9d3e0031"
    end

    on_intel do
      url "https://get.gear.rs/gear-v1.0.2-x86_64-apple-darwin.tar.xz"
      sha256 "d137e08d9eb584936e33c0cd2d1de17783d0e84146fa4a9524948afd45675e8d"
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
