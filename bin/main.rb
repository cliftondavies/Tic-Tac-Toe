#!/usr/bin/env ruby
puts 'Tic Tac Toe'
value = { 1 => nil, 2 => nil, 3 => nil,
          4 => nil, 5 => nil, 6 => nil,
          7 => nil, 8 => nil, 9 => nil }
board = [[value[1], value[2], value[3]],
         [value[4], value[5], value[6]],
         [value[7], value[8], value[9]]]
win = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7],
       [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

# Start or Exit Game
puts "Type 'Start' to begin a new game or 'Exit' to leave."
choice = gets.chomp.downcase
if choice == 'start'
  puts 'Welcome players, and best of luck!'
elsif choice == 'exit'
  exit
else
  puts 'Typo Error'
end

# Get player names
player_names = []
2.times do |player_no|
  puts "Player #{player_no + 1}: Please enter your name"
  player_names[player_no] = gets.chomp
end

# Get player moves
player_moves = [[], []]
outcome = 'draw'
no_of_moves = 1
while no_of_moves < 4
  2.times do |player_no|
    puts "#{name[player_no]}: Please play #{no_of_moves}st move"
    move = gets.chomp.to_i
    if move.between?(1, 9) && player_moves[0].index(move).nil? && player_moves[1].index(move).nil?
      player_moves[player_no] << move
      # Display current board between moves
      value[move] = if player_no.even?
                      'X'
                    else
                      'O'
                    end
      3.times { |row| puts " #{board[row][0]} | #{board[row][1]} | #{board[row][2]} " }
      if win.index(player_moves[player_no].sort)
        outcome = 'win'
        return "Congrats, #{player_names[player_no]}. You WON!"
      end
    else
      move.between?(1..9) ? 'Move already taken: Try another' : 'Move out of range: Try another'
      retry
    end
  end
  no_of_moves += 1
end
puts "It's a TIE!" if outcome == 'draw'

# Check if players would like a rematch.
puts 'GAME OVER!'
puts "Type 'Yes' to play again or 'No' to exit."
choice = gets.chomp.downcase
if choice == 'yes'
  start_game
elsif choice == 'no'
  exit
else
  puts 'Typo Error'
end
