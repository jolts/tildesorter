#!/usr/bin/env ruby

require 'fileutils'

module TildeSorter
  module Parser
    class Parse
      def self.parse(item)
        Dir[item]
      end
    end

    class DirectoryParser < Parse
      def self.directories
        parse Config.parse_dir + "/**"
      end
    end

    class FileParser < Parse
      def self.files
        FileUtils.cd(ENV['HOME'])
        Config.exts.each do |ext|
          return parse "**/*." + ext
        end
        FileUtils.cd(File.split($0).first)
      end
    end
  end
end
