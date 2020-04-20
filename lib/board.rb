class Board
  attr_reader :position

  def initialize
    @position = { 1 => ' ', 2 => ' ', 3 => ' ',
                  4 => ' ', 5 => ' ', 6 => ' ',
                  7 => ' ', 8 => ' ', 9 => ' ' }
  end

  def update(value, player_no)
    position[value] = if player_no.even?
                        'X'
                      else
                        'O'
                      end
  end
end
