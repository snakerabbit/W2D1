require_relative 'piece'
require_relative 'nullpiece'

class Board
  attr_accessor :grid
  def initialize
    @grid = Array.new(8){[]}
    self.populate
  end

  def populate
    row = 0
    while row < 8
      if row >= 2 && row <= 5
        8.times do |i|
          @grid[row][i] = NullPiece.instance
        end
      else
        8.times do |i|
          @grid[row] << Piece.new()
        end
      end
      row += 1
    end
  end

  def [](pos)
    x,y = pos
    @grid[x][y]
  end

  def []= (pos, piece)
    x,y = pos
    @grid[x][y] = piece
  end

  def in_bounds(x, y)
    if (x > 7) || (y > 7)
      return false
    elsif (x < 0) || (y < 0)
      return false
    end

    true
  end

  def dup
  end

  def move_piece(color = nil, from_pos, to_pos)
    raise "No piece at this location" if self[from_pos].is_a?(NullPiece)
    if self[to_pos].is_a?(Piece) && self[to_pos].is_a?(NullPiece) == false
      raise "Piece already at this location"
    end
    self[to_pos] = self[from_pos]
    self[from_pos] = NullPiece.new
  end

  def move_piece!(from_pos, to_pos)
  end

  def check_mate?
  end

protected

  def make_starting_grid

  end

  def find_king(color)
  end
end
