#!/usr/bin/env ruby

class GearAT012 < Formula
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
      url "https://get.gear.rs/gear-v0.1.2-aarch64-apple-darwin.tar.xz"
      sha256 "ee70159010ce7197d9fff6ffc364075bfc0857c6a0da49c18f7da6504dfd9d94"
    end

    on_intel do
      url "https://get.gear.rs/gear-v0.1.2-x86_64-apple-darwin.tar.xz"
      sha256 "cd786f4ed7636457810a8d31d23afa9476caac97fc4c7337a1726c5464e46a98"
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
