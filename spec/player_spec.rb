require './lib/player.rb'
# rubocop:disable Style/ClassVars

describe Player do
  describe '.list_names' do
    let(:player1_name) { 'Clifton' }
    let(:player2_name) { 'Terezie' }

    it 'returns the names of both players' do
      @@names = [player1_name, player2_name]
      expect(Player.list_names).to eql(@@names)
    end
  end

  describe '.list_plays' do
    let(:player1_plays) { [1, 2, 3] }
    let(:player2_plays) { [4, 5, 9] }

    it 'returns the moves of both players' do
      @@plays = [player1_plays, player2_plays]
      expect(Player.list_plays).to eql(@@plays)
    end
  end

  describe '.reset' do
    it 'clears all data about the players' do
      Player.reset
      expect(@@names).to eql([])
    end
  end

  describe '#name' do
    let(:name) { 'Clifton' }

    it 'gets the name of a player object' do
      player = Player.new(name)
      expect(player.name).to eql(name)
    end
  end

  describe '#play' do
    let(:name) { 'Clifton' }
    let(:value) { 2 }

    it 'stores the moves made by a particular player' do
      player = Player.new(name)
      player.play(value)
      expect(player.values).to include(value)
    end
  end
end

# rubocop:enable Style/ClassVars
