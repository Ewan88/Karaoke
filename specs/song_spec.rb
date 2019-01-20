### Song Test ###

require('minitest/autorun')
require('minitest/rg')

require_relative('../song.rb')

class TestSong < MiniTest::Test

  def setup
    @title = "Fuck the Police"
    @artist = "N.W.A"
    @song = Song.new(@title, @artist)
  end

  # get title
  def test_title
    assert_equal("Fuck the Police", @song.title)
  end

  # get artist
  def test_artist
    assert_equal("N.W.A", @song.artist)
  end

end
