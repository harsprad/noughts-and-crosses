class Grid
  attr_accessor :grid, :current_player

  def initialize
    @current_player = 0 # 0 = noughts, 1 = crosses
    @grid = Array.new(3) { Array.new(3) }
  end

  def to_pretty_string; end

  def add(row, col)
    return "error" unless @grid[row - 1][col - 1].nil?

    @grid[row - 1][col - 1] = if @current_player.zero?
                                "O"
                              else
                                "X"
                              end
    @current_player += 1
    @current_player %= 2
  end

  def winner?
    row_win?(@grid) || row_win?(transpose) || row_win?(rotate)
  end

  def transpose
    transposed_grid = Array.new(3) { Array.new(3) }
    (0..2).each do |i|
      (0..2).each do |j|
        transposed_grid[i][j] = @grid[j][i]
      end
    end
    transposed_grid
  end

  def rotate
    rotated_grid = Array.new(2) { Array.new(3) }
    (0..2).each do |i|
      rotated_grid[0][i] = @grid[i][i]
      rotated_grid[1][i] = @grid[2 - i][i]
    end
  end

  def row_win?(grid)
    size = grid.length
    (0..(size - 1)).each do |i|
      return true if grid[i].uniq.length == 1
    end
    false
  end
end
