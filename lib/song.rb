require 'pry'
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
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(song_name)
    new_song = Song.new
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(song_name)
    new_song = Song.new
    new_song.name = song_name
    @@all << new_song
    new_song
  end

  def self.find_by_name(song_name)
    @@all.find do |song|
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    @@all.sort_by do |song_inst|
      song_inst.name
    end
  end

  def self.new_from_filename(file)
    song_name = file.split(/[-.]/)[1].strip
    new_song =create_by_name(song_name)
    new_song.artist_name = file.split("-")[0].strip
    new_song
  end

  def self.create_from_filename(file)
    song_name = file.split(/[-.]/)[1].strip
    new_song =create_by_name(song_name)
    new_song.artist_name = file.split("-")[0].strip
    new_song
  end

  def self.destroy_all
    @@all.clear

  end

end
