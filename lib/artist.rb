require 'pry'

class Artist
  attr_accessor :name
  attr_reader :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

  def self.import_from_song(artist)
    @@all << artist 
  end


  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    Artist.new(name) unless @@all.any?{|artist| artist.name == name}
  end

  def self.create_artist_song_or_find(name, artist, genre)
    Song.create_song(name, artist, genre)

  end


  def print_songs
    @songs.each{|song| puts song.name}
  end

end
