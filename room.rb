### Room Class ###

class Room

  attr_reader :songs, :guests, :capacity, :entry_fee, :profit

  def initialize(songs, guests, capacity, entry_fee)
    @songs = songs
    @guests = guests
    @capacity = capacity
    @entry_fee = entry_fee
    @profit = 0
  end

  # sign in guests
  def sign_in(guest)
    if @guests.length < @capacity
      if guest.monies >= @entry_fee
        guest.monies -= @entry_fee
        guest.spendings += @entry_fee
        @profit += @entry_fee
        @guests.push(guest)
        return 1
      else
        return 2
      end
    else
      return 3
    end
  end

  # sign out guests
  def sign_out(guest)
    @guests.delete(guest)
  end

end
