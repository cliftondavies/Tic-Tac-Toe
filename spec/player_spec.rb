require './lib/player.rb'

describe Player do
  describe '.list_names' do
    it 'returns the names of both players' do
      @@names = %w[Clifton Terezie]
      expect(Player.list_names).to eql(%w[Clifton Terezie])
    end
  end

  describe '.list_plays' do
    it 'returns the moves of both players' do
      @@plays = [[1, 2, 3], [4, 5, 9]]
      expect(Player.list_plays).to eql([[1, 2, 3], [4, 5, 9]])
    end
  end
end
