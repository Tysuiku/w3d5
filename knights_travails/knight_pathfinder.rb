

class KnightPathfinder

  attr_reader :root_node , :children, :parent
  
  def initialize
    @root_node = [0,0]
    @children = []
    @parent = nil
  end

  def parent=(parent_node)
    if @parent != nil
      @parent.children.delete(self)
    end

    @parent = parent_node

    parent_node.children << self unless pnode == nil
  end

  


end
