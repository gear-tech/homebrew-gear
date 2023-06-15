# frozen_string_literal: true

require "cli/parser"

module Homebrew
  def self.glinks_args
    Homebrew::CLI::Parser.new do
      description <<~EOS
        Gear linked websites.
      EOS

      switch "-w", "--website",
             description: "Open gear official website."
      switch "-g", "--github",
             description: "Open gear github."
      switch "--discord",
             description: "Open gear discord."
      switch "--wiki",
             description: "Open gear wiki."
      switch "--docs", "--rustdocs",
             description: "Open gear rust docs."
    end
  end

  def self.glinks
    args = glinks_args.parse

    if args.website?
      system "open https://gear-tech.io"
    elsif args.github?
      system "open https://github.com/gear-tech/gear"
    elsif args.discord?
      system "open https://discord.gg/gear-protocol"
    elsif args.rustdocs?
      system "open https://docs.gear.rs"
    elsif args.wiki?
      system "open https://wiki.gear-tech.io"
    else
      puts <<~EOS
        website:    https://gear-tech.io
        github:     https://github.com/gear-tech/gear
        discord:    https://discord.gg/gear-protocol
        wiki:       https://wiki.gear-tech.io
        rustdocs:   https://docs.gear.rs
      EOS
    end
  end
end
