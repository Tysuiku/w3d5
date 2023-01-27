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

  def inspect
    "#<PolyTreeNode:#{self.object_id}>"
  end
end
