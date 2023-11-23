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
      sha256 "93c8540d23587092d30561001aa2d3fadcb44de348c5fc1d99a7f59d6b8974dc"
    end

    on_intel do
      url "https://get.gear.rs/gear-v1.0.1-x86_64-apple-darwin.tar.xz"
      sha256 "3479e4e1edbb80cde5f353c398033b344caee2fc2dc5837de4512cee99175a7a"
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
