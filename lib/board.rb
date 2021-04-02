require './lib/ship'
require './lib/cell'
require './lib/coordinates'
class Board
  attr_reader :cells

  def initialize(size = 4)
    @cells = {}

    for row in (1..size) do
      x_coord = (row + 64).chr

      for column in (1..size) do
        coordinate = "#{x_coord}#{column}"
        @cells[coordinate] = Cell.new(coordinate)
      end
    end

  end

end
