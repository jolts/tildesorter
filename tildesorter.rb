#!/usr/bin/env ruby
require 'optparse'
require 'optparse/time'
require 'lib/sorter'
require 'lib/parser'
require 'lib/config'

module TildeSorter
  class Opts
    def self.parse(args)
      opts = OptionParser.new do |opts|
        opts.banner = "Usage: #{$0} [options]"
        
        opts.separator ""
        opts.separator "Specific options:"

        opts.on("--parsedir PARSEDIR", "The directory to parse") do |p|
          Config.parse_dir = p
        end

        opts.on("--exts pdf,avi,mp3", Array, "Extensions to search for") do |e|
          Config.exts = e
        end

        opts.separator ""
        opts.separator "Common options:"

        opts.on_tail("-h", "--help", "Show this message") do
          puts opts
          exit
        end
      end
      opts.parse!(args)
    end
  end

  def self.run
    # Parse user options
    Opts.parse(ARGV)

    # Run program
    puts "DirectoryParser:"
    threads = Array.new
    threads << Thread.new { Parser::DirectoryParser.directories }
    puts "\n"
    puts "FileParser:"
    threads << Thread.new { Parser::FileParser.files }
    threads.each { |t| t.join }
  end
end

TildeSorter::run if $0 == __FILE__
