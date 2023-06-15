#!/usr/bin/env ruby

class GearAT016 < Formula
  desc "Computational Component of Polkadot Network"
  homepage "https://github.com/gear-tech/gear"
  license "GPL-3.0-or-later"
  version "0.1.6"

  livecheck do
    url "https://get.gear.rs"
    regex(/href=.*?gear-v(\d+\.\d+\.\d+)/i)
  end

  stable do
    on_arm do
      url "https://get.gear.rs/gear-v0.1.6-aarch64-apple-darwin.tar.xz"
      sha256 "746c3e402b88b2fb5e4c0b7d7005a96f9bf03f6fc494e32afef5b583df6b32d6"
    end

    on_intel do
      url "https://get.gear.rs/gear-v0.1.6-x86_64-apple-darwin.tar.xz"
      sha256 "e1c2ce908f83aa714c7cf3f19684b713a28d01187a493d35811aa7aff36cf5e0"
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
