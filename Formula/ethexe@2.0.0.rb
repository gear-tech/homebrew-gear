#!/usr/bin/env ruby

class EthexeAT200 < Formula
  desc "Web3 Ultimate Execution Engine"
  homepage "https://github.com/gear-tech/gear"
  license "GPL-3.0-or-later"
  version "2.0.0"

  livecheck do
    url "https://get.gear.rs"
    regex(/href=.*?gear-v(\d+\.\d+\.\d+)/i)
  end

  stable do
    on_macos do
      on_arm do
        url "https://get.gear.rs/ethexe-v2.0.0-aarch64-apple-darwin.tar.xz"
        sha256 "81a892bb3ceccc91bf600b07f2871cc4d00d2b78b31421ff98284c1695d56c76"
      end

      on_intel do
        url "https://get.gear.rs/ethexe-v2.0.0-x86_64-apple-darwin.tar.xz"
        sha256 "2d3b5d9395a3cb5a80fd3982169d943748cf0ce7ed130d4425ad8709e3b8492c"
      end
    end

    on_linux do
      on_arm do
        url "https://get.gear.rs/ethexe-v2.0.0-aarch64-unknown-linux-gnu.tar.xz"
        sha256 "aa14739116af4518cb216c4746fddb4c9e4399de826676948a9b0788c6c7abab"
      end

      on_intel do
        url "https://get.gear.rs/ethexe-v2.0.0-x86_64-unknown-linux-gnu.tar.xz"
        sha256 "573065e388baeada19e3f081ba300d0b2b62149c2cba84c39025f862df5eb6ba"
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
