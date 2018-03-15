require 'pry'
class MP3Importer
  attr_accessor :path, :files
  def initialize(path)
    @path = path
    @files = []
  end

  def files
    files = Dir.entries("#{@path}")
    @files = files.select do |file|
      file.length > 3
    end
  end

  def import
    self.files.each do |song|
      formattedSong= Song.new_by_filename(song)
      artist = Artist.find_or_create_by_name(formattedSong.artist.name)
      artist.add_song(formattedSong)
    end

  end

end
