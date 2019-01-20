### Runner File ###

require_relative('room.rb')
require_relative('guest.rb')
require_relative('song.rb')
require_relative('ui.rb')

ui = UI.new

total_profit = 0

system 'clear'
puts "\n"
puts "#{0x1D11E.chr('UTF-8')} Welcome to Karaoke v.0.0.1 #{0x1D11E.chr('UTF-8')}".center(40)
puts "\n"
ui.instructions

while true
  case input = gets.chomp
  when "room"
    ui.create_room
  when "guest"
    ui.guest
  when "song"
    ui.song
  when "sign"
    ui.sign
  when "profit"
    ui.profit
  when "play"
    ui.play
  when "help"
    ui.instructions
  when "quit"
    puts "are you sure you want to quit? all data will be lost (y/n)"
    if gets.chomp[0].downcase == "y"
      return false
    end
  else
    puts "invalid - type 'help' for instructions"
  end
end
