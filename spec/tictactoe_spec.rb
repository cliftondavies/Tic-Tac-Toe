require './lib/tictactoe.rb'
require './lib/player.rb'
# rubocop:disable Style/ClassVars

describe TicTacToe do
  subject { TicTacToe.new }

  describe '#check' do
    let(:player1_plays) { [1, 2, 3] }
    let(:player2_plays) { [4, 5, 9] }

    context 'when a player has 3 matching in a row' do
      let(:player_no) { 0 }

      it 'returns true' do
        @@plays = [player1_plays, player2_plays]
        is_expected.to be_check(player_no)
      end
    end

    context 'when a player does not have 3 matching in a row' do
      let(:player_no) { 1 }

      it 'returns false' do
        @@plays = [player1_plays, player2_plays]
        is_expected.not_to be_check(player_no)
      end
    end
  end

  describe '#win' do
    let(:player_no) { 1 }
    let(:player1_name) { 'Clifton' }
    let(:player2_name) { 'Terezie' }

    it 'returns win message for the player who wins' do
      @@names = [player1_name, player2_name]
      expect(subject.win(player_no)).to eql("***Congrats, Terezie. You WON!!!***\n")
    end
  end

  describe '#outcome' do
    context 'when the game has not been won' do
      it "returns a 'draw'" do
        expect(subject.outcome).to start_with('d')
      end
    end

    context 'when the game has been won' do
      let(:player_no) { 0 }

      it "returns a 'win'" do
        subject.win(player_no)
        expect(subject.outcome).to start_with('w')
      end
    end
  end
end

# rubocop:enable Style/ClassVars
