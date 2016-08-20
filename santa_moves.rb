class Santa

  def initialize(moves)
    @moves = moves
    @houses = 1
  end

  def visited_houses
    axis_x = 0
    axis_y = 0

    visited = {}
    visited["0.0"] = 1

    @moves.each_char do |c|
      case c
      when "^"
        axis_y += 1
      when "v"
        axis_y -= 1
      when "<"
        axis_x -= 1
      when ">"
        axis_x += 1
      end

      unless visited.has_key?("#{axis_x}.#{axis_y}")
        @houses += 1
        visited["#{axis_x}.#{axis_y}"] = 1
      end
    end

    @houses
  end
end

input = File.read("santa_moves.txt")

santa = Santa.new(input)
puts "Number of houses visited: #{santa.visited_houses}"