### UI class ###

class UI

  def initialize
    @room = nil
    @guests_outside = []
  end

  # get user input
  def input
    return gets.chomp
  end

  # display user instructions
  def instructions
    puts " commands:"
    puts "\n"
    puts "    room\t-\tcreate/view room".center(30)
    puts "    guest\t-\tcreate/view guests".center(30)
    puts "song\t-\tcreate a song".center(30)
    puts "     sign\t-\tsign guests in/out".center(30)
    puts "  profit\t-\tview profit made".center(30)
    puts "play  \t-\tplay songs".center(30)
    puts "    help\t-\tshow instructions".center(30)
    puts "quit\t-\texit program".center(30)
    puts "\n"
  end

  # take user input to create room
  def create_room()
    if @room == nil
      songs = []
      guests = []
      print "enter a capacity: "
      capacity = self.input.to_i
      print "enter an entry fee: "
      entry_fee = self.input.to_i
      @room = Room.new(songs, guests, capacity, entry_fee)
    else
      puts "\n" + "-- Room Contents --\n".center(30)
      puts "songs: #{@room.songs}"
      puts "guests: #{@room.guests}"
      puts "capacity: #{@room.capacity}"
      puts "entry fee: #{@room.entry_fee}"
      puts "\n"
    end
  end

  # take user input to create guests
  def guest()
    puts "\n"
    if @guests_outside.empty?
      puts "the guestlist is currently empty"
    else
      puts "current guestlist: "
      @guests_outside.each { |guest| print guest.name
         + ", "}
    end
    puts "enter 'create' to make a guest"
    if self.input.downcase == "create"
      print "enter a first name: "
      first_name = self.input.capitalize
      print "enter a last name: "
      last_name = self.input.capitalize
      name = first_name + " " + last_name
      print "enter a favourite song for #{name}: "
      fav_song = self.input
      print "enter a sum of monies for #{name}: "
      monies = self.input.to_i
      guest = Guest.new(name, fav_song, monies)
      @guests_outside.push(guest)
    end
  end

  # take user input to create songs
  def song
    if @room == nil
      puts "\n" + "make a room before adding songs!"
    else
      print "enter a song title: "
      title = self.input
      print "enter the song's artist: "
      artist = self.input
      song = Song.new(title, artist)
      @room.songs.push(song)
    end
  end

  # take user input to sign guests in or out
  ### pls refactor me v.0.0.2?
  def sign
    if @room == nil
      puts "\n" + "make a room before adding guests!"
    else
      if @guests_outside.empty? && @room.guests.empty?
        puts "\n" + "the guestlist is currently empty"
      else
        puts "\n" + "guests not signed in:"
        puts "#{@guests_outside}"
        puts "\n" + "guests signed in:"
        puts "#{@room.guests}"
        puts "\n"
        print "enter 'in' or 'out': "
        case self.input
        when "in"
          puts "\n"
          print "enter a guest's name to sign in: "
          a = self.input.downcase
          i = @guests_outside.index { |guest|
              guest.name.downcase == a }
          if i != nil
            x = @room.sign_in(@guests_outside[i])
            if x == 1
              puts "#{@guests_outside[i].name} signed in!"
              @guests_outside.delete_at(i)
            elsif x == 2
              puts "#{@guests_outside[i].name} could not afford the entry fee!"
            elsif x == 3
              puts "the room's capacity is full!"
            end
          else
            puts "#{a} could not be found"
          end
        when "out"
          puts "\n"
          print "enter a guest's name to sign out: "
          a = self.input.downcase
          i = @room.guests.select { |guest|
              guest.name.downcase == a }
          if i != nil
            @guests_outside.push(i[0])
            @room.sign_out(i[0])
            puts "#{i[0].name} signed in!"
          else
            puts "#{a} could not be found"
          end
        end
      end
    end
  end

  # view profit
  def profit
    if @room != nil
      puts "\n" + "you have made £#{@room.profit}"
    else
      puts "create a room first!"
    end
  end

  # play songs
  def play
    if @room != nil
      if !@room.songs.empty?
        @room.songs.each do |song|
          puts "\n" + "now playing #{song.title} by #{song.artist}"
          @room.guests.each do |guest|
            if guest.fav_song == song.title
              guest.cheer
            end
          end
        end
      else
        puts "the room has no songs!"
      end
    else
      puts "create a room first!"
    end
  end

end
