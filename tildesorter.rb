#!/usr/bin/env ruby
require 'fileutils'

module Parser
  class Parse
  end

  class DirectoryParser < Parse
    def initialize(directory=ENV['HOME'])
      @@directory = directory
    end

    def directories
      puts Dir.glob("#{@@directory}/**")
    end
  end

  class FileParser < Parse
    def initialize(*exts)
      @@exts = exts
    end

    def files
      FileUtils.cd(ENV['HOME'])
      @@exts.each do |ext|
        puts Dir.glob("**/*.#{ext}")
      end
    end
  end
end

module Sorter
  class Sort
  end

  class PDFSort < Sort
  end
end


#
puts "Directories:\n\n"
dp = Parser::DirectoryParser.new
dp.directories

puts "\n---\n\n"

puts "Files:\n\n"
fp = Parser::FileParser.new("pdf", "avi")
fp.files
