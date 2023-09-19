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
      sha256 "2205faa1309a6a5c55570f96515b50cf068a184814cada5eb5532614c81202c6"
    end

    on_intel do
      url "https://get.gear.rs/gear-v1.0.0-x86_64-apple-darwin.tar.xz"
      sha256 "bcc40580f818caee2c377dee4d375d58488a1abe511ee931b61780bf82ae3958"
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
