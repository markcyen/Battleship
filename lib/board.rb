require './lib/ship'
require './lib/cell'
require './lib/coordinates'

class Board
  attr_reader :cells

  def initialize(size = 4)
    @cells = {}

    (1..@size).each do |row|
      x_coord = (row + 64).chr
      (1..@size).each do |column|
        coordinate = "#{x_coord}#{column}"
        @cells[coordinate] = Cell.new(coordinate)
      end
    end
  end

  def valid_placement?(ship, coords)
    ship.length == coords.length &&
      Coordinates.consecutive?(coords)
  end

  def place(ship, coords)
  end

  def render(show_ship = false)
    render_string = "  "
    for x in (1..@size) do
      render_string.concat("#{x} ")
    end
    render_string.concat("\n")

    values = @cells.values
    rows = values.each_slice(@size)
    x = 1
    rows.each do |row|
      render_string.concat((x + 64).chr)
      render_string.concat(" ")
      row.each do |cell|
        render_string.concat(cell.render)
        render_string.concat(" ")
      end
      render_string.concat("\n")
      x += 1
    end
    render_string
  end
