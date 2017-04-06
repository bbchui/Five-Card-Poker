require 'byebug'
class TowersOfHanoi
  attr_reader :board
  def initialize(board = [[1, 2, 3], [], []])
    @board = board
  end

  def move(arr)
    raise 'No Rings' if @board[arr[0]].empty?

    from_pylon = @board[arr[0]]
    to_pylon = @board[arr[1]]
    ring = from_pylon.shift
    to_pylon.unshift(ring)
    @board
  end

  def won?
    @board == [[],[],[1,2,3]]
  end

  def prompt
    puts 'Please enter a value'
    print '>'
    input = gets.chomp
    input = parse_pos(input)
    raise 'Invalid Input' unless input.length == 2 &&
      input.all? {|el| el.between?(0,2)}
    input
  end

  def parse_pos(str)
    str.split(",").map {|el| el.to_i}
  end

  def play
    until won?
      begin
        input = prompt
      rescue => e
        puts e
        retry
      end
      move(input)
      print @board
    end
    puts 'You Win!' if won?
  end
end

b = TowersOfHanoi.new
b.play
