class Saddler

  attr_reader :map, :saddle_points

  def initialize(map)
    @map = map
    @saddle_points = []
  end

  def find_coordinates(x, y)
    @map[x-1][y-1]
  end

  def row(row)
    return @map[row-1] if valid_row?(row)
    raise "Invalid row"
  end

  def column(col)
    return (0..@map.length-1).map { |index| @map[index][col-1] } if valid_col?(col)
    raise "Invalid column"
  end

  def saddleRow?(x, y)
    val = find_coordinates(x, y)
    row(x).each { |coordinate| return false unless val >= coordinate }
    return true
  end

  def saddleColumn?(x, y)
    val = find_coordinates(x, y)
    column(y).each { |coordinate| return false unless val <= coordinate }
    return true
  end

  def saddlePoint?(x, y)
    saddleRow?(x, y) && saddleColumn?(x, y)
  end

  def saddleUp
    (1..@map.length).each do |row| 
      (0..@map[0].length).each do |col|
        @saddle_points.push([row, col]) if saddlePoint?(row, col)
      end
    end
    return @saddle_points unless @saddle_points.empty?
    return "No saddle points"
  end

private
  
  def valid_row?(row)
    return false if row < 1
    @map[row-1] != nil
  end

  def valid_col?(col)
    return false if col < 1
    @map[0][col-1] != nil
  end

end
