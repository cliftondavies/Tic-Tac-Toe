require './lib/tictactoe.rb'
require './lib/player.rb'

describe TicTacToe do
  describe '#check' do
    context 'when player has 3 in a row' do
      it 'returns true' do
        tictactoe = TicTacToe.new
        expect(tictactoe.check(0)).to eql(true)
        expect(tictactoe.check(1)).to eql(true)
      end
    end

    context 'when player does not have 3 in a row' do
      it 'returns false' do
        tictactoe = TicTacToe.new
        expect(tictactoe.check(0)).to eql(false)
        expect(tictactoe.check(1)).to eql(false)
      end
    end
  end

  # describe '#win' do
  #   #
  # end
end
