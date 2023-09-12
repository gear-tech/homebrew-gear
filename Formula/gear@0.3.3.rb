#!/usr/bin/env ruby

class GearAT033 < Formula
  desc "Computational Component of Polkadot Network"
  homepage "https://github.com/gear-tech/gear"
  license "GPL-3.0-or-later"
  version "0.3.3"

  livecheck do
    url "https://get.gear.rs"
    regex(/href=.*?gear-v(\d+\.\d+\.\d+)/i)
  end

  stable do
    on_arm do
      url "https://get.gear.rs/gear-v0.3.3-aarch64-apple-darwin.tar.xz"
      sha256 "6ee4f76570cdc19380e0ee0e94a4ae28f4da7a3b5f652024b5ac3c4c1c9ea6c3"
    end

    on_intel do
      url "https://get.gear.rs/gear-v0.3.3-x86_64-apple-darwin.tar.xz"
      sha256 "ba8642fa0832a0147610715cb457636eb9f343c136c7eb95d6ad8fd06f8ec9f5"
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
