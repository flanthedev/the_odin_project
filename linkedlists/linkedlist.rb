class Object #use this check if head/tail are unassigned
  def not_nil?; !nil?; end
end

class LinkedList
  attr_accessor :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value) #adds a new node to the end of the list
    node = Node.new(value)
    @tail.next_node = node if @head.not_nil?
    @head = node if @head.nil?
    @tail = node
    @size += 1
  end

  def prepend(value) #adds a new node to the start of the list
    node = Node.new(value)
    node.next_node = @head if @head.not_nil?
    @tail = node if @head.nil?
    @head = node
    @size += 1
  end

  def hash #turn list into a hash for #at(index) and #to_s
    hash = {}
    node = @head
    @size.times do |i|
      hash[i] = node
      node = node.next_node
    end
    hash
  end

  def at(index) #returns the node at the given index
    return if index >= @size
    hash[index]
  end

  def pop #removes the last element from the list
    ex_tail = @tail
    new_tail = at(@size-2)
    return if new_tail.nil?
    new_tail.next_node = nil
    @tail = new_tail
    @size -= 1
  end

  def contains?(value) #returns true if the passed in value is in the list and otherwise returns false.
    hash.any? { |key, node| node.value == value }
  end

  def find(data) #returns the index of the node containing data, or nil if not found.
    x = hash.select { |key, node| return key if node.value == data }
    #result.not_nil? ? result : nil
    x.empty? ? nil : x
  end

  def insert_at(index, value) #inserts the data at the given index
    old_node = at(index)
    prev_node = at(index-1)
    new_node = Node.new(value)
    @size += 1
    new_node.next_node = old_node
    prev_node.next_node = new_node
  end

  def remove_at(index) #removes the node at the given index
    ex_node = at(index)
    prev_node = at(index-1)
    after_node = at(index+1)
    @size -= 1
    prev_node.next_node = after_node
    ex_node.next_node = nil
  end

  def to_s #represent your LinkedList objects as strings, format should be: ( data ) -> ( data ) -> ( data ) -> nil
    hash.values.each do |node|
      print "( #{node.value} )"
      print " -> "
      print "nil\n" if node.next_node.nil?
    end
  end
end

class Node
  attr_accessor :value, :next_node
  def initialize(value=nil)
    @next_node = nil
    @value = value
  end
end
