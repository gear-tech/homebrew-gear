#!/usr/bin/env ruby

class EthexeAT1100 < Formula
  desc "Web3 Ultimate Execution Engine"
  homepage "https://github.com/gear-tech/gear"
  license "GPL-3.0-or-later"
  version "1.10.0"

  livecheck do
    url "https://get.gear.rs"
    regex(/href=.*?gear-v(\d+\.\d+\.\d+)/i)
  end

  stable do
    on_macos do
      on_arm do
        url "https://get.gear.rs/ethexe-v1.10.0-aarch64-apple-darwin.tar.xz"
        sha256 "9adff6b2080c60f5219d25deb434cfaa93f94c2647b3313be8bbdcf75e37e059"
      end

      on_intel do
        url "https://get.gear.rs/ethexe-v1.10.0-x86_64-apple-darwin.tar.xz"
        sha256 "beaa63ec9bbcad85571cb8320bf13c6f4f0b3811d5f0a65e3aeb012d69a6b57f"
      end
    end

    on_linux do
      on_arm do
        url "https://get.gear.rs/ethexe-v1.10.0-aarch64-unknown-linux-gnu.tar.xz"
        sha256 "b9965fb832a09c44d11e965636beaa506767cb047429d417125a657c4ea576d9"
      end

      on_intel do
        url "https://get.gear.rs/ethexe-v1.10.0-x86_64-unknown-linux-gnu.tar.xz"
        sha256 "d928fda64123590509e3e01546de6de8ca3dcec1b552bd45be3a26bee1301826"
      end
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink Dir["#{libexec}/ethexe"]
  end

  def caveats; <<~EOS

    Installed ethexe successfully!

    run `ethexe --help` to see available commands.

    EOS
  end
end
