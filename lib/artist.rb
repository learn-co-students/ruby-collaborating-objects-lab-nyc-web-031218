class Artist
  attr_accessor :name, :songs

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

  def self.create_by_name(name)
    artist = Artist.new(name)
    @@all << artist
    return artist
  end

  def self.find_by_name(name)
    @@all.each do |artist|
      if artist.name == name
        return artist
      end
    end
    return nil
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name)
      return find_by_name(name)
    else
      create_by_name(name)
    end
  end

  def print_songs
    @songs.each do |song|
      puts song.name
    end
  end
end
