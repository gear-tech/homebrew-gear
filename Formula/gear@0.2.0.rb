#!/usr/bin/env ruby

class GearAT020 < Formula
  desc "Computational Component of Polkadot Network"
  homepage "https://github.com/gear-tech/gear"
  license "GPL-3.0-or-later"
  version "0.2.0"

  livecheck do
    url "https://get.gear.rs"
    regex(/href=.*?gear-v(\d+\.\d+\.\d+)/i)
  end

  stable do
    on_arm do
      url "https://get.gear.rs/gear-v0.2.0-aarch64-apple-darwin.tar.xz"
      sha256 "5d9858584933129c5eca01194914437c33cdcee657d72c9add4d311d6b7341b7"
    end

    on_intel do
      url "https://get.gear.rs/gear-v0.2.0-x86_64-apple-darwin.tar.xz"
      sha256 "3806e447124beb4dbc6800bf9801cd3935e45ad153c7dd580643886957d2aad3"
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
