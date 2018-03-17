require 'pry'
class MP3Importer

  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    cur = Dir.pwd
    if @path[1, @path.length] != cur[cur.length-@path.length+1, cur.length]
      Dir.chdir @path
    end
    @files = []
    Dir.glob("*"){ |song|
      @files << song
    }
    @files
  end

  def import
    files.each do |file|
      artist = file.split(' - ')[0]
      if !Artist.all.any? { |a| a.name == artist }
        new_song = Song.new(file)
        new_artist = Artist.new(artist)
        new_artist.add_song(new_song)
      else
        if Artist.all.any? { |a| a.songs.any? {|s| s.name == file.split(' - ')[1] } }
          a = Artist.all.find { |ar| ar.name == artist }
          a.add_song file.split(' - ')[1]
        end
      end
    end
  end


end


#
# => ["Real Estate - It's Real - hip-hop.mp3",
#  "Real Estate - Green Aisles - country.mp3",
#  "Thundercat - For Love I Come - dance.mp3",
#  "Action Bronson - Larry Csonka - indie.mp3"]
