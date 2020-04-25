require './lib/tictactoe.rb'
require './lib/player.rb'

describe TicTacToe do
  describe '#check' do
    context 'when a player has 3 matching in a row' do
      it 'returns true' do
        tictactoe = TicTacToe.new
        @@plays = [[1, 2, 3], [4, 5, 9]]
        expect(tictactoe.check(0)).to eql(true)
      end
    end

    context 'when a player does not have 3 matching in a row' do
      it 'returns false' do
        tictactoe = TicTacToe.new
        @@plays = [[1, 2, 3], [4, 5, 9]]
        expect(tictactoe.check(1)).to eql(false)
      end
    end
  end

  describe '#win' do
    it 'returns win message for the player who wins' do
      tictactoe = TicTacToe.new
      @@names = %w[Clifton Terezie]
      expect(tictactoe.win(1)).to eql("***Congrats, Terezie. You WON!!!***\n")
    end
  end
end
