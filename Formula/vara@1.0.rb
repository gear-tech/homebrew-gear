#!/usr/bin/env ruby

class VaraAT10 < Formula
  desc "Computational Component of Polkadot Network"
  homepage "https://github.com/gear-tech/gear"
  license "GPL-3.0-or-later"
  version "0.1.1"

  livecheck do
    url "https://get.gear.rs"
    regex(/href=.*?gear-v(\d+\.\d+\.\d+)/i)
  end

  stable do
    on_arm do
      url "https://get.gear.rs/vara-testnet-v1.0-aarch64-apple-darwin.tar.xz"
      sha256 "cf8392d5f2a1a120452a2fd46549c4b4aa94098f773dc75c1606c5fd6b669200"
    end

    on_intel do
      url "https://get.gear.rs/vara-testnet-v1.0-x86_64-apple-darwin.tar.xz"
      sha256 "047426a4454e902504b8b306dc7fc61158a4b82995e80f325ca747a7692ce377"
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
