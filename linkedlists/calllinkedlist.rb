require_relative 'linkedlist'

list = LinkedList.new

list.append(2222)
list.append(3333)
list.prepend(1111)
list.append(4444)
list.append(6666)
list.append(7777)
list.append(8888)

list.to_s
puts "The list contains #{list.size} nodes."
puts "The head of the linked list is node #{list.head}"
puts "The tail of the linked list is node #{list.tail}"
puts "The second node of the linked list is #{list.at(1)}"

list.pop
puts "The new tail of the linked list is node #{list.tail}"
puts "Does the list contain 4444? #{list.contains?(4444)}"
puts "Does the list contain 5555? #{list.contains?(5555)}"
puts "What is the index of 1111?: #{list.find(1111)}"
puts "What is the index of 9898?: #{list.find(9898)}"

list.insert_at(2, 7777)
list.to_s
puts "The third node of the linked list is #{list.at(2)}"
list.remove_at(3)
list.to_s
puts "The fourth node of the linked list is #{list.at(3)}"

list.to_s
puts "The list contains #{list.size} nodes."
