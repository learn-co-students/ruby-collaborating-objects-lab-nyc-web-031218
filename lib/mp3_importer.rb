class MP3Importer

  attr_accessor :path

  def initialize (filepath)
    @path = filepath
    @files = []
  end

  def files
    files = Dir.entries(@path)
    @files = files[2..-1]
  end

  def import
    library = []
    self.files
    @files.each do |file|
      library << Song.new_by_filename(file)
    end
    library
  end

end
