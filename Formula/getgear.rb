#!/usr/bin/env ruby

class Getgear < Formula
  desc "getgear is the installer for gear binaries."
  homepage "https://github.com/gear-tech/gear"
  license "GPL-3.0-or-later"
  version "2.0.0"

  url "https://get.gear.rs/install.sh"
  sha256 "01fb3a0c070e5ad942ff68f10a80475a4985ec2b9963fca59382afdbcc9e4fee"

  def install
    bin.install "install.sh" => "getgear"
    bin.install_symlink Dir["#{libexec}/getgear"]
  end

  def caveats; <<~EOS
    Executable is linked as "getgear".

    Run `get-gear` to download your gear binary!
  EOS
  end
end
