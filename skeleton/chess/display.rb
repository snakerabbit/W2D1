require 'colorize'
require_relative 'board'
require_relative 'cursor'

class Display
  def initialize (board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end


  def build_grid
    @board.grid.each.map.with_index do |row, i|
      build_row(row, i)
    end
  end


  def build_row(row, i)
    row.map.with_index do |piece, j|
      color_options = colors_for(i, j)
      piece.to_s.colorize(color_options)
    end
  end

  def colors_for(i, j)
    if [i, j] == @cursor.cursor_pos && @cursor.selected
      bg = :light_green
    elsif [i, j] == @cursor.cursor_pos
      bg = :light_red
    elsif (i + j).odd?
      bg = :light_blue
    else
      bg = :light_yellow
    end
    {background: bg}
  end

  def render
    rendered_grid = build_grid
    rendered_grid.each do |row|
      puts row.join
    end

  end
end
