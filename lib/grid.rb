class Grid
  attr_accessor :grid, :currentPlayer

  def initialize
    @currentPlayer = 0 #0 = noughts, 1 = crosses
    @grid = Array.new(3) {Array.new(3)}
  end

  def toPrettyString
  end

  def add(row, col)
    unless (@grid[row-1][col-1] == nil) 
      return "error" 
    end
    @grid[row-1][col-1] = if (@currentPlayer == 0) 
                        "O" 
                      else 
                        "X"
                      end
    @currentPlayer += 1
    @currentPlayer %= 2
  end

  def winner?
    row_win?(@grid) || row_win?(transpose) || row_win?(rotate)
  end

  def transpose
    transposed_grid = Array.new(3) {Array.new(3)}
    for i in 0..2 do
      for j in 0..2 do
        transposed_grid[i][j] = @grid[j][i]
      end
    end
    transposed_grid
  end

  def rotate
    rotated_grid = Array.new(2) {Array.new(3)}
    for i in 0..2 do
      rotated_grid[0][i] = @grid[i][i]
      rotated_grid[1][i] = @grid[2-i][i]
    end
  end

  def row_win?(grid)
    size = grid.length
    for i in 0..(size-1) do
      if (grid[i].uniq.length == 1) 
        return true 
      end
    end
    false
  end
end
