require_relative "lib/grid"
require_relative "lib/display_tools"

include DisplayTools

ttt = Grid.new

loop do
  while ttt.add(*DisplayTools.player_choice) == "error"
    puts "\nAlready played there, please choose another place to play"
  end

  puts ttt.to_pretty_string

  winner_exists = ttt.winner?
  DisplayTools.round_end(winner_exists)
  break if winner_exists
end

puts "Game Ended, gg wp"
