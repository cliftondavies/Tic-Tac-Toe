require './lib/board.rb'

describe Board do
  subject { Board.new }

  describe '#update' do
    let(:position) { 1 }

    context 'when player number is even' do
      let(:player_no) { 0 }

      it 'marks X at the position specified by value' do
        subject.update(position, player_no)
        expect(subject.position[1]).to eql('X')
      end
    end

    context 'when player number is odd' do
      let(:player_no) { 1 }

      it 'marks O at the position specified by value' do
        subject.update(position, player_no)
        expect(subject.position[1]).to eql('O')
      end
    end
  end
end
