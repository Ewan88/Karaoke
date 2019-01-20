### Room Test ###

require('minitest/autorun')
require('minitest/rg')

require_relative('../room.rb')
require_relative('../guest.rb')
require_relative('../song.rb')

class TestRoom < MiniTest::Test

  def setup
    @song1 = Song.new("N.W.A", "Fuck the Police")
    @song2 = Song.new("", "")
    @song3 = Song.new("", "")
    @song4 = Song.new("", "")
    @songs = [@song1]
    @guest1 = Guest.new("Margaret Thatcher",
                        "Ding-Dong, the Witch is Dead!", 3)
    @guest2 = Guest.new("", "", 2)
    @guest3 = Guest.new("", "", 2)
    @guest4 = Guest.new("", "", 1)
    @guests = [@guest1]
    @room = Room.new(@songs, @guests, 2, 2)
  end

  # can list songs - return array of songs
  def test_songs
    assert_equal(@songs, @room.songs)
  end

  # can list guests - return array of guests
  def test_guests
    assert_equal(@guests, @room.guests)
  end

  # can sign guests in
  # can take money from guest
  # profit goes up
  # guest's spending goes up
  def test_sign_in
    @room.sign_in(@guest2)
    assert_equal(0, @guest2.monies)
    assert_equal(2, @room.guests.length)
    assert_equal(2, @room.profit)
    assert_equal(2, @guest2.spendings)
  end

  # does not sign guest in if guests > capacity
  def test_sign_in__capacity_full
    @room.sign_in(@guest2)
    @room.sign_in(@guest3)
    assert_equal(2, @room.guests.length)
  end

  # does not sign guest in if guest_monies < entry_fee
  def test_sign_in__cannot_afford
    @room.sign_in(@guest4)
    assert_equal(1, @room.guests.length)
  end

  # can sign guests out
  def test_sign_out
    @room.sign_out(@guest2)
    assert_equal(1, @room.guests.length)
  end

end
