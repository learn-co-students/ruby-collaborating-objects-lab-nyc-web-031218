require 'pry'
class Artist

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def self.find_or_create_by_name(name)
    # binding.pry
    if @@all.any? { |artist| artist.name == name }
      return self
    else
      Artist.new(name)
    end

  end

  def self.all
    @@all
  end

  def songs
    @songs
  end

  def save
    @@all << self
  end

  def print_songs
    @songs.each do |song|
      puts song.name
    end
  end

  def add_song(song)
    @songs << song
  end

end
