class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    song.save
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find { |song| song.name == name }
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      return self.find_by_name(name)
    else
      return self.create_by_name(name)
    end
  end
  
  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end
  
  def self.new_from_filename(filename)
    filename = filename.split(' - ')
    name = filename[0]
    artist_name = filename[1].sub('.mp3', '')
    
    self.create_by_name(name)
  end
end
