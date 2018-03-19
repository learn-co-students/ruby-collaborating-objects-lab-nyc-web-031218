require_relative "./artist.rb"

class Song
  attr_accessor :artist, :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.new_by_filename(file_name)
    arr = file_name.split('-').map {|string| string.strip}
    song = Song.new(arr[1])
    artist = Artist.find_or_create_by_name(arr[0])
    song.artist = artist
    song
  end

end
