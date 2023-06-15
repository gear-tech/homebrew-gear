#!/usr/bin/env ruby

class GearATNightly < Formula
  desc "Computational Component of Polkadot Network"
  homepage "https://github.com/gear-tech/gear"
  license "GPL-3.0-or-later"
  version "nightly"

  # Ignore the checksum of the binaries for supporting the latest.
  #
  # TODO: figure out a better solution mb from brew docs.
  stable do
    on_arm do
      url "https://get.gear.rs/gear-nightly-aarch64-apple-darwin.tar.xz"
    end

    on_intel do
      url "https://get.gear.rs/gear-nightly-x86_64-apple-darwin.tar.xz"
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
