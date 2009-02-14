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
        old_dir = Dir.getwd
        FileUtils.cd(ENV['HOME'])
        Config.exts.each do |ext|
          puts Dir.glob("**/*.#{ext}")
        end
        FileUtils.cd(old_dir)
        ## FileUtils.cd(File.path(__FILE__))
      end
    end
  end
end
