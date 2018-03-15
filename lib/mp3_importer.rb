require "pry"

class MP3Importer

  attr_accessor(:path)


  def initialize(file_path)
    @path = file_path
  end

  def files
    files = Dir["#{@path}/*.mp3"]
    # binding.pry
    files = files.collect { |file| File.basename(file) }
    # files = files.collect { |file| file.chomp(".mp3") }
  end

  def import
    # binding.pry

    files.each do |file|
      Song.new_by_filename(file)
    end
  end

end
