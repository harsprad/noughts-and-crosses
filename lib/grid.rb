class Grid
  attr_accessor :grid :currentPlayer

  def initialize
    @currentPlayer = 0 #0 = noughts, 1 = crosses
    @grid = Array.new(3) {Array.new(3)}
  end

  def winner?
  end

  def toPrettyString
  end

  def add
  end
end
