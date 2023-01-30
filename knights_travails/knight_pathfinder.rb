require_relative "PolyTree.rb"

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
    @start_pos = PolyTreeNode.new(start_pos)
    @possible_pos = [@start_pos]
  end

  def new_move_positions(pos)

    returned_pos = KnightPathFinder.valid_moves(pos)
    returned_pos.delete_if {|ele| ele.nil? || @possible_pos.include?(ele)}

    returned_pos.each do |coordinate|
      @possible_pos << coordinate unless @possible_pos.include?(coordinate)
    end

    returned_pos

  end

    


end
