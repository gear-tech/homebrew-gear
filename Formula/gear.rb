#!/usr/bin/env ruby

class Gear < Formula
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
        url "https://get.gear.rs/gear-v2.0.0-aarch64-apple-darwin.tar.xz"
        sha256 "80a31bb615750bfdf1eb72f5c2e2859cfafb3638d513c462921549a0301ea433"
      end

      on_intel do
        url "https://get.gear.rs/gear-v2.0.0-x86_64-apple-darwin.tar.xz"
        sha256 "c8b719a391ca8d978f007c4f1ec10c1a4a87dc112ef2d4f5c55a3ed2814b0872"
      end
    end

    on_linux do
      on_arm do
        url "https://get.gear.rs/gear-v2.0.0-aarch64-unknown-linux-gnu.tar.xz"
        sha256 "4565eb72e2f5ed9181f73eb49edc49e6a59172d6fcc2f45e586068d1dbee638d"
      end

      on_intel do
        url "https://get.gear.rs/gear-v2.0.0-x86_64-unknown-linux-gnu.tar.xz"
        sha256 "96b070b796e0165d5a03b70fd28ce3aa3f07e07237a298604257c8c91c5313e2"
      end
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
