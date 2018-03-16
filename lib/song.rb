require 'pry'

class Song
  attr_accessor :name, :genre
  attr_reader
  ALL = []

  def initialize(name, artist = "none_given", genre = "none_given")
    @name = name
    @artist = artist
    @genre = genre
  end

  def self.new_by_filename(file)
      arr = file.split(/ - |\./)
      artist = arr[0]
      name = arr[1]
      genre = arr[2]
      if !ALL.include? name
        song = Song.new(name, Artist.new(artist), genre)
        ALL << song
      end
      song
  end

  def artist
    @artist
  end

  def artist=(artist)
    @artist =  artist
  end


  def self.create_song(name, artist, genre)
    if !ALL.include? name
    song = Song.new(name, artist, genre)
    ALL << song
    end

    artist1 = Artist.find_or_create_by_name(artist)

    if artist1
    artist1.add_song(song)

    artist1.save
    end
  end



end
