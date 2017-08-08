class Piece
  def initialize
    # @type = type
  end

  def symbol
    :piece
    # raise NotImplementedError
  end

  def to_s
    symbol.to_s
  end
end
