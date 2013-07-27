class SquareEncoder

  attr_accessor :msg, :count, :line_length, :square

  def initialize(msg)
    @msg = msg.split.join
    @count ||= @msg.length
    @line_length ||= Math.sqrt(@count).ceil
    @square ||= (1..@line_length).to_a.map { |line| take_line unless @msg.length == 0 }.compact!
  end

  def take_line
    @msg.slice!(0, @line_length)
  end

  def square_message
    working = ""
    (@square.length + 1).times do
      (0..@square.length-1).each { |index| working << @square[index].slice!(0) unless @square[index].empty? }
      working += " " unless @square[0] == ""
    end
    working
  end

end
