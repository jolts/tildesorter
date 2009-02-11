#!/usr/bin/env ruby
require 'fileutils'

module TildeSorter

class DirectoryParser
  attr_accessor :pictures, :torrents

  def initialize(directory)
    @directory = directory
  end

  def directories
    dirs = Array.new
    IO.popen("ls -l #{@directory} | grep '^d'").each do |dir|
      dirs << dir
          end
    dirs
end
end



dir = DirectoryParser.new("/home/johan")
puts dir.directories
end
