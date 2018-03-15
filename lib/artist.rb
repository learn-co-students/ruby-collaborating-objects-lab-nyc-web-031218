require "pry"

class Artist

  attr_accessor(:name, :songs)

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.find_or_create_by_name(name)
    if @@all.none? { |artist| artist.name == name }
      artist = Artist.new(name)
      artist.save
      artist
    else @@all.select { |artist| artist.name == name }
   end
  end

  def print_songs
    artist = @@all.select { |artist| artist.name == self.name }
    puts artist.songs
  end

end

# Pry.start
