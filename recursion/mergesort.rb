def merge_sort(ary)
  #initialize solution array
  sorted = []

  #simply return the array if it's only one number
  if ary.length == 1
    return ary

  else
    # dividing array and recursion
    split = (ary.length/2).floor
    left = merge_sort(ary.slice(0..split-1))
    right = merge_sort(ary.slice(split..-1))

    (0...ary.length).each do |i|
      # when one of the comparisons is gone, push from the other
      if left[0].nil?
        sorted.push(right[0])
        right.shift
      elsif right[0].nil?
        sorted.push(left[0])
        left.shift

      #compare, push to solution array, remove from left/right array
      else
        if left[0] <= right[0]
          sorted.push(left[0])
          left.shift
        else
          sorted.push(right[0])
          right.shift
        end
      end

    end
    return sorted
  end
end

p merge_sort([12])
p merge_sort([4, 2, 1])
p merge_sort([5, 43, 23, 85, 453, 4, 2, 1])
p merge_sort([420, 240, 450, 731, 980, 40, 342])
p merge_sort([2, 4, 6, 8, 7, 1, 2, 2, 8, 3, 7, 5, 9, 6])
p merge_sort([2, 1, 3, 47, 53, 44, 31, 25, 26, 8, 43, 77, 52, 94, 56])
