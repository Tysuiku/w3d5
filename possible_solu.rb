class PolyTreeNode
  attr_accessor :value, :parent, :children

  def initialize(value, parent = nil)
    @value = value
    @parent = parent
    @children = []
  end

  def add_child(child_node)
    children << child_node
    child_node.parent = self
  end

  def remove_child(child_node)
    children.delete(child_node)
    child_node.parent = nil
  end
end

class KnightPathFinder
  attr_reader :root_node, :considered_positions

  def initialize(starting_position)
    @root_node = PolyTreeNode.new(starting_position)
    @considered_positions = [starting_position]
    build_move_tree
  end

  def build_move_tree
    queue = [root_node]

    until queue.empty?
      current_node = queue.shift
      current_position = current_node.value
      new_move_positions(current_position).each do |next_position|
        next_node = PolyTreeNode.new(next_position, current_node)
        current_node.add_child(next_node)
        queue << next_node
      end
    end
  end

  def new_move_positions(position)
    row, col = position
    possible_moves = [[-2, -1], [-2, 1], [-1, -2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1]]
    new_positions = possible_moves.map do |move|
      [row + move[0], col + move[1]]
    end
    new_positions.select do |pos|
      pos.all? { |coord| coord.between?(0, 7) } && !considered_positions.include?(pos)
    end
  end

  def find_path(end_position)
    end_node = root_node.bfs(end_position)
    path = trace_path_back(end_node)
    path.reverse
  end

  def trace_path_back(end_node)
    path = [end_node.value]
    current_node = end_node

    until current_node.parent.nil?
      current_node = current_node.parent
      path << current_node.value
    end

    path
  end
end
