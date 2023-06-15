# typed: true
# frozen_string_literal: true

require "cli/parser"

module Homebrew
  module_function

  def gi_args
    Homebrew::CLI::Parser.new do
      description <<~EOS
        gear binaries installer.
      EOS

      flag "--tag=",
           description: "Install a specific version of gear."

      flag "--to=",
           description: "Install gear to a specific path."

    end
  end

  def gi
    args = gi_args.parse

    installer = "gear-installer"
    installer_link = "#{libexec}/#{installer}"

    if !File.exist?("#{installer_link}")
        system "curl" "https://get.gear.rs/install.sh" ">" "#{installer}.sh"
        system "chmod" "+x" "#{installer}.sh"

        libexec.install Dir["*"]
        bin.install_symlink Dir["#{libexec}/#{installer}"]
    end

    cmd = "#{installer_link}"
    cmd += " --tag=#{args.tag}" if args.tag
    cmd += " --to=#{args.to}" if args.to

    system cmd
  end
end
