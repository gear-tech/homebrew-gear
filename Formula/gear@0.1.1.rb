#!/usr/bin/env ruby

class GearAT011 < Formula
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
      url "https://get.gear.rs/gear-v0.1.1-aarch64-apple-darwin.tar.xz"
      sha256 "88460ef2d8da5b2512a30d71bb3880ed2142963c91db18bc2f84310899edfa21"
    end

    on_intel do
      url "https://get.gear.rs/gear-v0.1.1-x86_64-apple-darwin.tar.xz"
      sha256 "568d439ebb3bd0aba1d7aad31fe6c232ffae579e439b113d70d8d29765b0c3ca"
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
