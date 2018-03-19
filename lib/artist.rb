require 'pry'

class Artist
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    save
  end

  def name=(name)
    @name = name
  end

  def self.all
    @@all
  end

  def add_song(song_instance)
    song_instance.artist = self
  end

  def songs
    Song.all.select do |song|
      song.artist == self
    end
  end

  def print_songs
    songs.each do |song|
      puts song.name
    end
  end

  def self.find_or_create_by_name(artist_name)
    if !@@all.any?{|instance| instance.name == artist_name}
      artist = Artist.new(artist_name)
    end
  end

  def save
    @@all << self
  end
end
