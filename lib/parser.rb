require 'fileutils'

module TildeSorter
  module Parser
    class Parse
    end

    class DirectoryParser < Parse
      def self.directories
        puts Dir.glob("#{Config.parse_dir}/**")
      end
    end

    class FileParser < Parse
      def self.files
        FileUtils.cd(ENV['HOME'])
        Config.exts.each do |ext|
          puts Dir.glob("**/*.#{ext}")
        end
        ## FileUtils.cd(File.dirname(__FILE__))
      end
    end
  end
end
