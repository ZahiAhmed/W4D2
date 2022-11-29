class Board
  attr_accessor :grid
  def initialize
    @grid = Array.new(8) {Array.new(8)}

  end

  def [](position)
    row, col = position
    self[row][col]
  end

  def []=(position, val)
    row, col = position
    self[row][col] = val
  end
  
  def move_piece(start_pos, end_pos)
    if self[end_pos] == nil
      self[end_pos] = self[start_pos]
      self[start_pos] = nil
    end
  end


end
