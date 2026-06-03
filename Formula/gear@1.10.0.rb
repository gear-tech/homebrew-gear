#!/usr/bin/env ruby

class GearAT1100 < Formula
  desc "Web3 Ultimate Execution Engine"
  homepage "https://github.com/gear-tech/gear"
  license "GPL-3.0-or-later"
  version "1.10.0"

  livecheck do
    url "https://get.gear.rs"
    regex(/href=.*?gear-v(\d+\.\d+\.\d+)/i)
  end

  stable do
    on_macos do
      on_arm do
        url "https://get.gear.rs/gear-v1.10.0-aarch64-apple-darwin.tar.xz"
        sha256 "d6a48f65cce4f82f25762332234edf41f0efba867981c255789197c27de25d82"
      end

      on_intel do
        url "https://get.gear.rs/gear-v1.10.0-x86_64-apple-darwin.tar.xz"
        sha256 "b06e3996e1501f20f0c19a1dbc7c007be91febb11b3f6351a7fef912b628e03c"
      end
    end

    on_linux do
      on_arm do
        url "https://get.gear.rs/gear-v1.10.0-aarch64-unknown-linux-gnu.tar.xz"
        sha256 "a3d79cd018beded09e215f163ce646b78ee504b4318515d494bc54142bbba1f9"
      end

      on_intel do
        url "https://get.gear.rs/gear-v1.10.0-x86_64-unknown-linux-gnu.tar.xz"
        sha256 "7d7ab0306e975bcb824dd8f29d2a7bbb9f5646925ca03085c2be54bb482fbce4"
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
