#!/usr/bin/env ruby

class GearAT030 < Formula
  desc "Computational Component of Polkadot Network"
  homepage "https://github.com/gear-tech/gear"
  license "GPL-3.0-or-later"
  version "0.3.0"

  livecheck do
    url "https://get.gear.rs"
    regex(/href=.*?gear-v(\d+\.\d+\.\d+)/i)
  end

  stable do
    on_arm do
      url "https://get.gear.rs/gear-v0.3.0-aarch64-apple-darwin.tar.xz"
      sha256 "dd5a105e37d00c7fd67e74294e20cec27adeaf3b4c25c316a8a81d484c5b0240"
    end

    on_intel do
      url "https://get.gear.rs/gear-v0.3.0-x86_64-apple-darwin.tar.xz"
      sha256 "e586780ccd8cb2725c756c1171ca43064dc58f6aba638abb6550f11aad14a3e4"
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
