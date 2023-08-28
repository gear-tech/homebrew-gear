#!/usr/bin/env ruby

class GearAT032 < Formula
  desc "Computational Component of Polkadot Network"
  homepage "https://github.com/gear-tech/gear"
  license "GPL-3.0-or-later"
  version "0.3.2"

  livecheck do
    url "https://get.gear.rs"
    regex(/href=.*?gear-v(\d+\.\d+\.\d+)/i)
  end

  stable do
    on_arm do
      url "https://get.gear.rs/gear-v0.3.2-aarch64-apple-darwin.tar.xz"
      sha256 "34ecf93d2714b277535c7604fde5b9e7cf63cda6b6c41f5e5ccbb984b3cb565f"
    end

    on_intel do
      url "https://get.gear.rs/gear-v0.3.2-x86_64-apple-darwin.tar.xz"
      sha256 "d13bb988f39e4f24710d4ec97734f36e9d38721ccdb97527d81996642052c075"
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
