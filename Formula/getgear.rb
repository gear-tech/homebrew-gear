#!/usr/bin/env ruby

class Getgear < Formula
  desc "getgear is the installer for gear binaries."
  homepage "https://github.com/gear-tech/gear"
  license "GPL-3.0-or-later"
  version "0.1.0"

  url "https://get.gear.rs/install.sh"
  sha256 "439b07572b319acd49a1f08ce821f71b7f32cca7e9187bc480d571cd70187687"

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
