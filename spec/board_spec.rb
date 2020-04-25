require './lib/board.rb'

describe Board do
  describe '#update' do
    context 'when player number is even' do
      it 'marks X at the position specified by value' do
        board = Board.new
        board.update(1, 0)
        expect(board.position[1]).to eql('X')
      end
    end

    context 'when player number is odd' do
      it 'marks O at the position specified by value' do
        board = Board.new
        board.update(1, 1)
        expect(board.position[1]).to eql('O')
      end
    end
  end
end
