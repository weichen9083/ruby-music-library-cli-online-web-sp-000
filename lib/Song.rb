class Song 
  attr_accessor :name, :artist, :genre
  
  @@all =[]
  
  def initialize(name, artist = nil, genre = nil)
     @name = name 
    if self.artist == nil && artist != nil
      self.artist = artist 
    end 
    if self.genre == nil && genre != nil
      self.genre = genre 
    end 
    

  end 
  
  def self.all 
    @@all
  end 
  
  def self.destroy_all
    @@all.clear
  end 
  
  def save 
    @@all << self
  end 
  
  def self.create(name)
    a = self.new(name)
    a.save
    a
  end 
  
    def artist=(artist)
    @artist = artist
    artist.add_song(self)
    end
    
    def genre=(genre)
    @genre = genre
    genre.add_song(self)
    end
    
    def self.find_by_name(name)
      @@all.find {|song|song.name == name}
    end 
    
    def self.find_or_create_by_name(name)
      self.find_by_name(name) || self.create(name)
    end 
    
def self.new_from_filename(filename)
    array = filename.split(" - ")

    song_name = array[1]
    artist_name = array[0]
    genre_name = array[2].split(".mp3").join

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end


    
    

  
    
  
end 

