#!/usr/bin/env ruby

class GearAT101 < Formula
  desc "Computational Component of Polkadot Network"
  homepage "https://github.com/gear-tech/gear"
  license "GPL-3.0-or-later"
  version "1.0.1"

  livecheck do
    url "https://get.gear.rs"
    regex(/href=.*?gear-v(\d+\.\d+\.\d+)/i)
  end

  stable do
    on_arm do
      url "https://get.gear.rs/gear-v1.0.1-aarch64-apple-darwin.tar.xz"
      sha256 "3b4cb1559b49bd365217d6fb48a19aa533e4919ba51062ead3afa4bd3b9b4971"
    end

    on_intel do
      url "https://get.gear.rs/gear-v1.0.1-x86_64-apple-darwin.tar.xz"
      sha256 "a7133a68b929a2a3493525d8637d4005c844bb3bbfacb12211f848c5dda6b1c6"
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
