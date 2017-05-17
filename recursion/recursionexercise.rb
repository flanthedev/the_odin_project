#((((1) + 2) + 3) + 4)
def sum_upto(n)
  return 1 if n == 1
  sum_upto(n-1) + n
end

puts sum_upto(1)
puts sum_upto(2)
puts sum_upto 3
puts sum_upto 4



def append(ary, n)
  return ary if n < 0
  ary << n
  append(ary, n-1)
end

append [], 1 # []
append [], 2 # [2, 1, 0]
array = []
append(array, 4)
p array


def reverse_append(ary, n)
  return ary if n < 0
  ary.unshift(n)
  reverse_append(ary, n-1)
end

array2 =[]
reverse_append(array2, 5)
p array2



def fib(n)
  return 0 if n == 0
  return 1 if n == 1
  fib(n-1) + fib(n-2)
end

# 0, 1, 1, 2, 3, 5, 8, 13 ...
# fib 0 => 0
# fib 10 => 55
puts fib(10)
