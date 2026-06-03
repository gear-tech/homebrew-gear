#!/usr/bin/env ruby

class GearNightly < Formula
  desc "Web3 Ultimate Execution Engine"
  homepage "https://github.com/gear-tech/gear"
  license "GPL-3.0-or-later"
  version "nightly"

  # Ignore the checksum of the binaries for supporting the latest.
  #
  # TODO: figure out a better solution mb from brew docs.
  stable do
    on_macos do
      on_arm do
        url "https://get.gear.rs/gear-nightly-aarch64-apple-darwin.tar.xz"
      end

      on_intel do
        url "https://get.gear.rs/gear-nightly-x86_64-apple-darwin.tar.xz"
      end
    end

    on_linux do
      on_arm do
        url "https://get.gear.rs/gear-nightly-aarch64-unknown-linux-gnu.tar.xz"
      end

      on_intel do
        url "https://get.gear.rs/gear-nightly-x86_64-unknown-linux-gnu.tar.xz"
      end
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
