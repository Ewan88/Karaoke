### Guest Class ###

class Guest

  attr_reader :name, :fav_song
  attr_accessor :spendings, :monies

  def initialize(name, fav_song, monies)
    @name = name
    @fav_song = fav_song
    @monies = monies
    @spendings = 0
  end

  def cheer
    puts "#{@name}: Woohoo! I love this song!"
  end

end
