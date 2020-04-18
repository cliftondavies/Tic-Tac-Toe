#!/usr/bin/env ruby
# rubocop:disable Metrics/BlockLength

require_relative '../lib/tictactoe.rb'
require_relative '../lib/board.rb'
require_relative '../lib/player.rb'

loop do
  # Initialize Game
  puts "
  X-X-X-X-X-X-X
   TIC TAC TOE
  O-O-O-O-O-O-0
  -------------
  GAME MENU
  >>> Enter 'Start' to begin a New Game

  >>> Enter 'Exit' to Leave.
  "
  choice = gets.chomp.downcase
  until choice == 'start'
    if choice == 'exit'
      exit
    else
      puts 'Typo Error! Please try again.'
      choice = gets.chomp.downcase
    end
  end
  puts '
  | Welcome players, and best of luck! |
  --------------------------------------
  '
  game = TicTacToe.new
  board = Board.new
  Player.reset
  player1 = nil
  player2 = nil

  # Get Player Names
  2.times do |player_no|
    puts "---Player #{player_no + 1}: Please enter your name---"
    name = gets.chomp
    until name.match?(/[A-Za-z]/)
      puts 'Please enter a valid name!
      '
      name = gets.chomp
    end
    player_no.zero? ? player1 = Player.new(name) : player2 = Player.new(name)
    puts ' '
  end
  names = Player.list_names

  # Play Game
  plays = Player.list_plays
  no_of_moves = 0
  until game.outcome == 'win' || !board.position.value?(' ')
    2.times do |player_no|
      puts '------------------------------'
      puts ">> #{names[player_no]}: Please Enter Move #{no_of_moves + 1}. [Value between 1-9]<<"
      value = gets.to_i
      puts ' '
      until value.between?(1, 9) && plays[0].index(value).nil? && plays[1].index(value).nil?
        puts value.between?(1, 9) ? 'Move already taken! Try another.' : 'Move out of range! Try another.'
        value = gets.to_i
        puts ' '
      end
      player_no.zero? ? player1.play(value) : player2.play(value)
      board.update(value, player_no)
      puts '-----------------------------'
      puts "|    #{board.position[1]}    |   #{board.position[2]}    |   #{board.position[3]}    |"
      puts "|    #{board.position[4]}    |   #{board.position[5]}    |   #{board.position[6]}    |"
      puts "|    #{board.position[7]}    |   #{board.position[8]}    |   #{board.position[9]}    |"
      puts '-----------------------------
      '
      puts game.check(player_no) if no_of_moves >= 2 && TicTacToe::WIN.index(plays[player_no].sort)
      break if game.outcome == 'win' || no_of_moves == 8
      no_of_moves += 1
    end
  end
  puts "Oh noo...It's a TIE!\n" if game.outcome == 'draw'
  sleep 3

  # End Game and Check if players would like a rematch
  puts "-----------------------
  GAME OVER!
  -----------------------------
  >>> Enter 'Yes' to play again

  >>> 'No' to exit."
  puts ' '
  choice = gets.chomp.downcase
  until choice == 'yes'
    if choice.match(/no|exit/)
      exit
    else
      puts "\nTypo Error! Please try again."
      puts ' '
      choice = gets.chomp.downcase
    end
  end
  puts '-----------------------------------------------------END---------------------------------------------------
                                             Loading New Game...
  '
  sleep 6
end

# rubocop:enable Metrics/BlockLength
