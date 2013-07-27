class TreasureFinder
  attr_accessor :map, :current_clue, :x, :y, :moves, :solution

  def initialize(map, first_clue)
    @map = map
    @current_clue = first_clue
    @moves = Moves.new
    @observers = [@moves]
    @solution = solve
  end

private

  def solve
    manage_next_clue until solution?
    return @current_clue
  end

  def manage_next_clue
    split_clue
    find_next_clue
    publish_clue
  end

  def find_next_clue
    @current_clue = @map[@x-1][@y-1]
  end

  def publish_clue
    @observers.each { |o| o.publish(@current_clue) }
  end

  def split_clue
    @x, @y = integerize(0), integerize(1)
  end

  def integerize(position)
    @current_clue.to_s[position].to_i
  end

  def solution?
    split_clue && @map[@x-1][@y-1] == @current_clue
  end
end

class Moves < Array

  def publish(pub)
    self << pub
  end

end
