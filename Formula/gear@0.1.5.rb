#!/usr/bin/env ruby

class GearAT015 < Formula
  desc "Computational Component of Polkadot Network"
  homepage "https://github.com/gear-tech/gear"
  license "GPL-3.0-or-later"
  version "0.1.5"

  livecheck do
    url "https://get.gear.rs"
    regex(/href=.*?gear-v(\d+\.\d+\.\d+)/i)
  end

  stable do
    on_arm do
      url "https://get.gear.rs/gear-v0.1.5-aarch64-apple-darwin.tar.xz"
      sha256 "17621b768b08e376a190be0674adb64f125d680cf3d0ea04be466802dd6d88c7"
    end

    on_intel do
      url "https://get.gear.rs/gear-v0.1.5-x86_64-apple-darwin.tar.xz"
      sha256 "6ddb0d5d0016d670e66f288a9305df07f2e2dc7194731200d23ee4b3bb4a4ed7"
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
