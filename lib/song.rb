require 'pry'

class Song
  attr_accessor :artist, :name

  def initialize(name = "", artist = "")
    @name = name
    @artist = artist
  end

  def self.new_by_filename(file_name)
    arr = file_name.split(" - ")
    song = Song.new(arr[1], Artist.new(arr[0]))
  end
end
