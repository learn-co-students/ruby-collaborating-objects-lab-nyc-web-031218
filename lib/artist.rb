class Artist

  attr_accessor :name, :songs
  @@all = []

  def initialize (name)
    @songs = []
    @name = name
  end

  def save
    @@all << self
  end

  def add_song (song)
    @songs << song
  end

  def print_songs
    song_list = ""
    @songs.each do |song|
      puts song.name
    end
  end

  def self.find_or_create_by_name (name)
    artist = Artist.find_by_name(name)
    if artist
      artist
    else
        new_artist = Artist.new(name)
        new_artist.save
        new_artist
    end
  end

  def self.find_by_name (name)
    @@all.find do |artist|
      artist.name == name
    end
  end

  def self.all
    @@all
  end


end
