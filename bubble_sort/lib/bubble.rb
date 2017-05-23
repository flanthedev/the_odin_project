def bubble_sort(x)
	while true
		switch = false
		(0..x.length-2).each do |i|
			if x[i] > x[i+1]
				x[i], x[i+1] = x[i+1], x[i]
				switch = true
			end
		end
		break if switch == false
	end
	p x
end
=begin
numbers = [3, 2, 9, 7, 1, 8, 5 , 4]
bubble_sort(numbers)
=end

def bubble_sort_by(x)
	if block_given?
		while true
			switch = false
			(0..x.length-2).each do |i|
				if yield(x[i], x[i+1]) > 0
					x[i], x[i+1] = x[i+1], x[i]
					switch = true
				end
			end
			break if switch == false
		end
	else
		puts "no block input"
		bubble_sort(x)
	end
	puts x
end
=begin
bubble_sort_by(["hi","hello","hey"]) do |left,right|
	left.length - right.length
end
=end
