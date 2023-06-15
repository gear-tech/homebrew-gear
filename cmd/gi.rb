# frozen_string_literal: true

require "cli/parser"

module Homebrew
  def self.gi_args
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

  def self.gi
    args = gi_args.parse

    # TODO: cache install.sh (issue #1)
    cmd = "curl https://get.gear.rs/install.sh | sh -s -- "
    cmd += "--tag=#{args.tag}" if args.tag
    cmd += "--to=#{args.to}" if args.to

    system cmd
  end
end
