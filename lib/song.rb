require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def song.all
    @@all
  end

  def save
    self.class.all << self
  end

  def song.create #class constructor
    song = self.new
    self.all << song
    song
  end

  def song.new_by_name(title) #class constructor
    song = self.new
    song.name = title
    song
  end

  def song.create_by_name(title) #class constructor
    song = self.create
    song.name = title
    song
  end

  def song.find_by_name(title) #class finder
    result = self.all.detect {|song| song.name == title}
    result
  end

  def song.find_or_create_by_name(title)
    #either return a matching song instance with that name or create a new song with the name and return the song instance
    result = self.find_by_name(title)
    if result
      result
    else
      self.create_by_name(title)
    end
  end

  def song.alphabetical
    sorted = self.all.sort_by {|song| song.name}
    sorted
  end

  def song.new_from_filename(filename)
    song_array = filename.split(" - ")
    song_array[1] = song_array[1].chomp(".mp3")
    song = self.new
    song.name = song_array[1]
    song.artist_name = song_array[0]
    song
  end

  def song.create_from_filename(filename)
    result = self.new_from_filename(filename)
    song = self.create
    song.name = result.name
    song.artist_name = result.artist_name
    song
  end

  def song.destroy_all
    self.all.clear
  end
end
