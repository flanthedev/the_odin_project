require_relative 'tree'

ary1 = [4, 3, 5, 7, 2, 8, 1, 10, 45, 23, 56, 35]
ary2 = [22, 44, 55, 647, 34, 76, 567, 45245, 34, 546, 745, 567, 234, 527, 447, 256, 3472, 3472, 4562, 34683, 23573, 234678]

tree1 = Tree.new
tree2 = Tree.new

puts "\nbuild tree (unsorted)"
puts "Array: #{ary1}\n\n"
p tree1.build_tree(ary1)

puts "\nbuild tree (sorted)"
puts "Array: #{ary1}\n\n"
p tree1.build_tree_sorted(ary1)

puts "\nbuild large tree"
puts "Array: #{ary2}\n\n"
p tree2.build_tree(ary2)

puts "\nbuild large tree (sorted)"
puts "Array: #{ary2}\n\n"
p tree2.build_tree_sorted(ary2)

puts "\n\n\nbreadth first search"
value = ary1.sample
puts "find value: #{value}\n\n"
p tree1.breadth_first_search(value)

puts "\ndepth first search"
value = ary1.sample
puts "find value: #{value}\n\n"
p tree1.depth_first_search(value)

puts "\n\n\ndepth first search (recursive)"
value = ary1.sample
puts "find value: #{value}\n\n"
p tree1.dfs_rec(value)

puts "\ndepth first search (recursive)"
value = ary2.sample
puts "find value: #{value}\n\n"
p tree2.dfs_rec(value)
