class PolyTreeNode
  attr_reader :parent, :children, :value

  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end

  def parent=(pnode)
    if @parent != nil
      @parent.children.delete(self)
    end
    @parent = pnode

    pnode.children << self unless pnode == nil

    # @parent.children.delete(self)
    # @children.conact(pnode.children)
    # p pnode.children
    # p "#{@children} current node children"
    # pnode.children.concat(@children)
    # @parent = @children[0]
  end

  def add_child(child_node)
    child_node.parent = (self)
  end

  def remove_child(child_node)
    raise "error" if !@children.include? child_node
    child_node.parent = (nil)
  end

  def dfs(target)
    return self if self.value == target
    self.children.each do |node|
      prev = node.dfs(target)
      return prev unless prev == nil
    end
    return nil
  end

  def bfs(target)
    queue = [self]

    until queue.empty?
      current_node = queue.shift
      return current_node if current_node.value == target
      queue.concat(current_node.children)
    end

    nil
  end

  def inspect
    "#<PolyTreeNode:#{self.object_id}>"
  end
end
