#!/usr/bin/env ruby

module TildeSorter
  class DirectoryParser
    def self.directories(directory)
      @directory = directory

      puts Dir[@directory+"/**"]
    end
  end
end

puts TildeSorter::DirectoryParser.directories("/home/gig")
