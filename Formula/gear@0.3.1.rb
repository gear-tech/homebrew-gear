#!/usr/bin/env ruby

class GearAT031 < Formula
  desc "Computational Component of Polkadot Network"
  homepage "https://github.com/gear-tech/gear"
  license "GPL-3.0-or-later"
  version "0.3.1"

  livecheck do
    url "https://get.gear.rs"
    regex(/href=.*?gear-v(\d+\.\d+\.\d+)/i)
  end

  stable do
    on_arm do
      url "https://get.gear.rs/gear-v0.3.1-aarch64-apple-darwin.tar.xz"
      sha256 "4f304c12d8af5c01687ed17bae31c206b392803dee1e420565caace41e6f9e14"
    end

    on_intel do
      url "https://get.gear.rs/gear-v0.3.1-x86_64-apple-darwin.tar.xz"
      sha256 "6f389d1814261316df4d26ea6531b745e3238b699807ebd24c1fc0428b2429fe"
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
