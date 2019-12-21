require 'pry'

class MP3Importer
  attr_reader :path

  def initialize(file_path)
    @path = file_path
  end

  def files
@files = Dir.entries(@path)
@files.select!{|file| file.include? "mp3" }
end

  def import
    files.each{|file|
    arr = file.split(/ - |\./)
    artist = arr[0]
    name = arr[1]
    genre = arr[2]
    Artist.create_artist_song_or_find(name, artist, genre)
    }


  end



end
