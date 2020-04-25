class TicTacToe
  WIN = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7],
         [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]].freeze

  attr_reader :outcome
  attr_accessor :plays, :names

  def initialize
    @plays = Player.list_plays
    @names = Player.list_names
    @outcome = 'draw'
  end

  def check(player_no)
    WIN.any? do |item|
      union = item & @plays[player_no]
      union.size == 3
    end
  end

  def win(player_no)
    @outcome = 'win'
    message = "***Congrats, #{@names[player_no]}. You WON!!!***\n"
    message
  end
end
