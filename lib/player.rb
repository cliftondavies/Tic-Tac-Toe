# rubocop:disable Style/ClassVars
class Player
  attr_accessor :name
  attr_reader :values, :names, :plays

  @@names = []
  @@plays = []

  def self.list_names
    @@names
  end

  def self.list_plays
    @@plays
  end

  def self.reset
    @@names = []
    @@plays = []
  end

  def initialize(name)
    @name = name
    @values = []
    @@names << @name
    @@plays << @values
  end

  def play(value)
    values << value
  end
end

# rubocop:enable Style/ClassVars
