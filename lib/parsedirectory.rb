#!/usr/bin/env ruby

module Parser
  class DirectoryParser
    def self.directories(directory)
      @directory = directory
      puts Dir.glob(@directory+"/**")
    end
  end

  class FileParser
  end
end

module Sorter
end

puts Parser::DirectoryParser.directories("/home/gig")
