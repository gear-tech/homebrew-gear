#!/usr/bin/env ruby

class GearAT013 < Formula
  desc "Computational Component of Polkadot Network"
  homepage "https://github.com/gear-tech/gear"
  license "GPL-3.0-or-later"
  version "0.1.3"

  livecheck do
    url "https://get.gear.rs"
    regex(/href=.*?gear-v(\d+\.\d+\.\d+)/i)
  end

  stable do
    on_arm do
      url "https://get.gear.rs/gear-v0.1.3-aarch64-apple-darwin.tar.xz"
      sha256 "36d5876fd8846f5ab5db1cdbfe91691f2cfefeb2234eb579664fd6931f9db66c"
    end

    on_intel do
      url "https://get.gear.rs/gear-v0.1.3-x86_64-apple-darwin.tar.xz"
      sha256 "615b511be9305126d8c4cdfb331a7a96df9d9164571b8214a9f61c5bd318ba24"
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
