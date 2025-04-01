require_relative "../lib/grid.rb"

describe Grid do
  subject(:grid){ described_class.new }

  describe '#add' do
    # Command method - changes the observable state but doesn't change the value
    # -> test the change in the observable state

    it 'input 1, 1 works' do
      grid.add(1, 1)
      actual_grid_value = grid.grid[0][0]
      expect(actual_grid_value).to eq("O")
    end
  end

  describe '#row_win?' do

    context 'when top row wins' do
      top_win = Array.new(2){ Array.new(3) }
      top_win[0] = ["X", "X", "X"]
      it 'X wins' do
        expect(grid).to be_row_win(top_win)
      end

      top_win[0] = ["O", "O", "O"]
      it 'O wins' do
        expect(grid).to be_row_win(top_win)
      end
    end

    context 'when no winners' do
      no_win = Array.new(3){ Array.new(3) }
      it 'returns false' do
        expect(grid).not_to be_row_win(no_win)
      end
    end
  end

  describe '#transpose' do
    # Query method - Returns a result -> Test the return value
    context 'when empty grid' do
      it 'returns itself' do
        expect(grid.transpose).to eq(Array.new(3){ Array.new(3) })
      end
    end

    context 'when diagonal grid' do
      it 'returns itself' do
        grid.add(1,1)
        grid.add(2,2)
        grid.add(3,3)
        expect(grid.transpose).to eq(grid.grid)
      end
    end

    context 'when grid not symmetric' do
      it 'returns the transpose' do
        grid.add(1,2)
        transposed_grid = Array.new(3){ Array.new(3) }
        transposed_grid[1] = ["O", nil, nil]
        expect(grid.transpose).to eq(transposed_grid)
      end
    end
  end

  describe '#rotate' do
    # Query method - returns a result -> test the result
    context 'when grid diagonals filled' do

      it 'returns diagonals' do
        (1..3).each do |i|
          grid.add(i, i)
        end 
        grid.add(3, 1)
        grid.add(1, 3)
        desired_result = [ ["O", "X", "O"], ["X", "X", "O"] ]
        expect(grid.rotate).to eq(desired_result)
      end
    end

    context 'when grid is complete' do

      it 'returns diagonals' do
        (1..3).each do |i|
          (1..3).each do |j|
            grid.add(i, j)
          end
        end 
        desired_result = [ ["O", "O", "O"], ["O", "O", "O"] ]
        expect(grid.rotate).to eq(desired_result)
      end
    end
  end
end
