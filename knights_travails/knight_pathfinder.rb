require_relative "PolyTree.rb"

class KnightPathFinder
  attr_accessor :start_pos, :possible_pos
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
    returned_pos.delete_if { |ele| @possible_pos.include?(ele) }

    returned_pos.each do |coordinate|
      @possible_pos << coordinate unless @possible_pos.include?(coordinate)
    end

    returned_pos
  end

  def build_move_tree
    queue = [@start_pos]

    until queue.empty?
      current_node = queue.shift
      current_pos = current_node.value

      nmp = new_move_positions(current_pos)

      nmp.each do |next_pos|
        next_node = PolyTreeNode.new(next_pos)
        current_node.add_child(next_node)
        queue << next_node
      end
    end
    puts "success"
  end
end
