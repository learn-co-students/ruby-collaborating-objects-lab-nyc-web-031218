class MP3Importer
  attr_accessor :path
  def initialize(path)
    @path = path
  end

  def files
    Dir["#{self.path}/*"].map do |filepath|
      File.basename(filepath)
    end
  end

  def import
    self.files.each do |filename|
      Song.new_by_filename(filename)
    end
  end

end
