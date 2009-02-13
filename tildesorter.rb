#!/usr/bin/env ruby
require 'fileutils'
require 'optparse'
require 'optparse/time'

module TildeSorter
  module Parser
    class Parse
    end

    class DirectoryParser < Parse
      def self.directories
        puts Dir.glob("#{$parse_dir}/**")
      end
    end

    class FileParser < Parse
      def self.files
        old_dir = Dir.getwd
        FileUtils.cd(ENV['HOME'])
        $exts.each do |ext|
          puts Dir.glob("**/*.#{ext}")
        end
        FileUtils.cd(old_dir)
      end
    end
  end


  module Sorter
    class Sort
    end

    class PDFSort < Sort
    end
  end

  
  class Opts
    def self.parse(args)
      opts = OptionParser.new do |opts|
        opts.banner = "Usage: #{$0} [options]"
        
        opts.separator ""
        opts.separator "Specific options:"

        opts.on("--parsedir PARSEDIR", "The directory to parse") do |p|
          $parse_dir = p
        end

        opts.on("--exts pdf,avi,mp3", Array, "Extensions to search for") do |e|
          $exts = e
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
    # Defaults
    $parse_dir = ENV['HOME']
    $exts = "pdf"
    
    # Parse user options
    Opts.parse(ARGV)
    
    # Run program
    Parser::DirectoryParser.directories
    Parser::FileParser.files
  end
end


TildeSorter::run if $0 == __FILE__ and not ARGV.empty?
