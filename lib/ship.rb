class Ship
  attr_reader :name, :length, :health

  def initialize(name, length)
    @name = name
    @length = length
    @health = length
  end

  def hit
    @health -= 1
    @health = 0 if @health < 0
  end
end
