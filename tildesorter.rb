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
      exts.each do |ext|
        @@ext = ext
      end
    end

    def files
      FileUtils.cd(ENV['HOME'])
      puts Dir.glob("**/*.#{@@ext}")
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
dp = Parser::DirectoryParser.new
dp.directories

puts "\n---\n\n"

fp = Parser::FileParser.new("pdf")
fp.files
