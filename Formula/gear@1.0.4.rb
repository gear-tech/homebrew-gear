#!/usr/bin/env ruby

class GearAT104 < Formula
  desc "Computational Component of Polkadot Network"
  homepage "https://github.com/gear-tech/gear"
  license "GPL-3.0-or-later"
  version "1.0.4"

  livecheck do
    url "https://get.gear.rs"
    regex(/href=.*?gear-v(\d+\.\d+\.\d+)/i)
  end

  stable do
    on_arm do
      url "https://get.gear.rs/gear-v1.0.4-aarch64-apple-darwin.tar.xz"
      sha256 "f6ccd858871a36c1e1251cec109fb0544d51658124d1eb03eb6e2961c7fb8a8f"
    end

    on_intel do
      url "https://get.gear.rs/gear-v1.0.4-x86_64-apple-darwin.tar.xz"
      sha256 "f1b9cc1055f041bf874cf5433c98311d5f9cfddad97839088a7bebee5b175e86"
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
