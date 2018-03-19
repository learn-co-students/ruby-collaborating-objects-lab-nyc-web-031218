class Song

  attr_accessor :name, :artist

# @@all = []

  def initialize(name)
    @name = name
    # @@all << self
  end


  def self.new_by_filename(name)
    parts = name.split(" - ")
    artist_only = parts[0]
    song_name = parts[1]
    new_song = Song.new(song_name)
    new_song.artist = Artist.find_or_create_by_name(artist_only)
    new_song.artist.add_song(new_song)
    new_song

  end

end


#
