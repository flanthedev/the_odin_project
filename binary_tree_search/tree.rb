class Tree
  attr_accessor :root

#node items
  class Node
    attr_accessor :value, :left, :right

    def initialize(value)
      @value = value
      @left = nil
      @right = nil
    end

    def insert(new_value)
      if new_value < value
        @left.nil? ? @left = Node.new(new_value) : @left.insert(new_value)
      elsif new_value > value
        @right.nil? ? @right = Node.new(new_value) : @right.insert(new_value)
      end
    end
  end

#intialize root
  def initialize(root=nil)
    @root = root
  end

  def insert(value)
    @root.nil? ? @root = Node.new(value) : @root.insert(value)
  end
# build tree
  def build_tree(ary) #turns array into binary tree full of Node objects
    ary.each do |value|
      self.insert(value)
    end
  end
# search functions
  def build_tree_sorted(ary) #turns array into binary tree full of Node objects
    sorted_ary = ary.sort
    sorted_ary.each do |value|
      self.insert(value)
    end
  end

  def breadth_first_search(value)
    queue = [@root]
    until queue.empty?
      q = queue[0]
      return q if q.value == value
      queue.push(q.left) unless q.left.nil?
      queue.push(q.right) unless q.right.nil?
      queue.shift
    end
  end

  def depth_first_search(value)
    stack = [@root]
    until stack.empty?
      s = stack[-1]
      return s if s.value == value
      stack.pop
      stack.push(s.right) unless s.right.nil?
      stack.push(s.left) unless s.left.nil?
    end
  end

  def dfs_rec(value, node=@root)
    return node if node.value == value

    if value < node.value && node.left
      dfs_rec(value, node.left)
    elsif value > node.value && node.right
      dfs_rec(value, node.right)
    end
  end

end
