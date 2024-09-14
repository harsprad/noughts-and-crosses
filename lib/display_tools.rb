module DisplayTools
  def player_choice
    puts "Which row would you like to play?"
    row = gets.chomp
    puts "Which column would you like to play?"
    col = gets.chomp
    [row.to_i, col.to_i]
  end

  def round_end(winner_exists)
    if winner_exists
      puts "Well done, you win the game!"
    else
      puts "Next player's turn:"
    end
  end
end
