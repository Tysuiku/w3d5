require_relative "skeleton/lib/00_tree_node.rb"

class KnightPathFinder
  def self.valid_moves(pos)
    possible_moves = [[1, 2], [2, 1], [-1, -2], [-2, -1], [-2, 1], [-1, 2], [2, -1], [1, -2]]
    good_moves = []
    x, y = pos
    possible_moves.each do |pair|
      test_x = x + pair[0]
      test_y = y + pair[1]
      good_moves << [test_x, test_y] unless [test_x, test_y].any? { |ele| ele < 0 || ele > 7 }
    end

    good_moves
  end

  def initialize(start_pos)
    @start_pos = start_pos
    @possible_pos = @start_pos
  end
end
