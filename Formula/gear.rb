#!/usr/bin/env ruby

class Gear < Formula
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
      sha256 "bfbd45b3e5f5577f873c8da36e2a2b67a7b7f835c652736594869344749b0e65"
    end

    on_intel do
      url "https://get.gear.rs/gear-v0.3.2-x86_64-apple-darwin.tar.xz"
      sha256 "f6627e54bfa0263f225d7947cf23e0d86dba4138016e9dd19c1c1e02bcd98132"
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
