def merge_sort(ary)
  if ary.length == 1
    return ary
  else
    sorted = []
    split = (ary.length/2).floor
    left = merge_sort(ary.slice(0..split-1))
    right = merge_sort(ary.slice(split..-1))

    (0...ary.length).each do |i|
      if left[0].nil?
        sorted.push(right[0])
        right.shift
      elsif right[0].nil?
        sorted.push(left[0])
        left.shift
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

p merge_sort([2, 4, 1, 2, 2, 8, 3, 7, 5, 9, 6])
