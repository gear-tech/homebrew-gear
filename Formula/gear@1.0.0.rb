#!/usr/bin/env ruby

class GearAT100 < Formula
  desc "Computational Component of Polkadot Network"
  homepage "https://github.com/gear-tech/gear"
  license "GPL-3.0-or-later"
  version "1.0.0"

  livecheck do
    url "https://get.gear.rs"
    regex(/href=.*?gear-v(\d+\.\d+\.\d+)/i)
  end

  stable do
    on_arm do
      url "https://get.gear.rs/gear-v1.0.0-aarch64-apple-darwin.tar.xz"
      sha256 "41d316b304e75e39ecd2874fc15cd8a5ce6a81c402a5becf48116f6ac0fb39a6"
    end

    on_intel do
      url "https://get.gear.rs/gear-v1.0.0-x86_64-apple-darwin.tar.xz"
      sha256 "579ffa5fe714ebf7e6c6ddf52861eaf2152a60976979693001f770fa8c172fa1"
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
