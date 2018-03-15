require "pry"

class Song

  attr_accessor(:name, :artist)

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.new_by_filename(file)
    file_array = file.split(" - ")
    name = file_array[1]
    artist = file_array[0]
    # binding.pry
    new_song = self.new(name)
    new_song.artist_name = artist
    @@all << new_song
    new_song
    # binding.pry
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end

end
