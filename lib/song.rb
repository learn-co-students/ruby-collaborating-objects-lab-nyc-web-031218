require 'pry'
class Song
  attr_accessor :name, :artist

  def initialize (name)
    @name = name
  end

  def self.new_by_filename(filename)
    filename = filename[0..-5].split("-")
    song_name = filename[1].strip
    artist_name = filename [0].strip
    song = Song.new(song_name)
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.artist.add_song(song)
    song
  end

end
