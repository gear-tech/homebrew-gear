#!/usr/bin/env ruby

class GearAT103 < Formula
  desc "Computational Component of Polkadot Network"
  homepage "https://github.com/gear-tech/gear"
  license "GPL-3.0-or-later"
  version "1.0.3"

  livecheck do
    url "https://get.gear.rs"
    regex(/href=.*?gear-v(\d+\.\d+\.\d+)/i)
  end

  stable do
    on_arm do
      url "https://get.gear.rs/gear-v1.0.3-aarch64-apple-darwin.tar.xz"
      sha256 "cde420dd0f2318b6028222d9cf8fc841925ed2007000c8863fb436256bb87092"
    end

    on_intel do
      url "https://get.gear.rs/gear-v1.0.3-x86_64-apple-darwin.tar.xz"
      sha256 "d60e23fd2aea4e02449739e6d43032b6ef63913d23f2439ccee67b100451c453"
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
