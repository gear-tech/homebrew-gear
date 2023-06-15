#!/usr/bin/env ruby

class GearAT014 < Formula
  desc "Computational Component of Polkadot Network"
  homepage "https://github.com/gear-tech/gear"
  license "GPL-3.0-or-later"
  version "0.1.4"

  livecheck do
    url "https://get.gear.rs"
    regex(/href=.*?gear-v(\d+\.\d+\.\d+)/i)
  end

  stable do
    on_arm do
      url "https://get.gear.rs/gear-v0.1.4-aarch64-apple-darwin.tar.xz"
      sha256 "0d34b25ab732fb8b4184dc7ce042967f6bbe61ca952f1b59e478ec2383bc7ffd"
    end

    on_intel do
      url "https://get.gear.rs/gear-v0.1.4-x86_64-apple-darwin.tar.xz"
      sha256 "c8e6b093c8efde62c21c2d76e3a802c49453c072407ae245c7cc22bb03a2263a"
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
