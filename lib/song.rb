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
  song=self.new
  song.save
  song
  end
  def Song.new_by_name(name)
    song=self.new
    song.name=name
    song
  
  end
def Song.create_by_name(name)
  song=self.new
  song.name=name
  song.save
  song
end
def Song.find_by_name(name)
  @@all.detect {|song| song.name == name}
end
def Song.find_or_create_by_name(name)
Song.find_by_name(name) || Song.create_by_name(name)
    
end
def self.alphabetical
@@all.sort {|a,b| a.name <=> b.name}
end

def self.new_from_filename(filename)
split_filename = filename.chomp(".mp3").split(" - ")
song = Song.new
song.name = split_filename[1]
song.artist_name = split_filename[0]
song
end

def self.create_from_filename(filename)
  split_filename = filename.chomp(".mp3").split(" - ")
  song = Song.new
  song.name = split_filename[1]
  song.artist_name = split_filename[0]
  song.save
  song
  end
def self.destroy_all
  @@all=[]
end
end