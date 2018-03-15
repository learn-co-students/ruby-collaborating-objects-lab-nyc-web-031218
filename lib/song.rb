class Song

  attr_accessor(:name, :artist)

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file)
    file_array = file.split(" - ")
    name = file_array[1]
    artist = file_array[0]
    Song.new(name)
  end

end
