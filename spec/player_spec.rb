require './lib/player.rb'

describe Player do
  describe '.list_names' do
    it 'returns the names of both players' do
      @@names = %w[Clifton Terezie]
      expect(Player.list_names).to eql(%w[Clifton Terezie])
    end
  end
end
