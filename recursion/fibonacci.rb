def fibs(n)
  ary = [0, 1]
  (1..n-2).each do |i|
    ary.push(ary[-1] + ary[-2])
  end
  return ary
end

def fibs_rec(n, ary=[0,1])
  return ary if n == 1
  return ary if ary.size == n
  fibs_rec(n, ary << ary[-1] + ary[-2])
end

p fibs(10)
p fibs_rec(1)
p fibs_rec(2)
p fibs_rec(3)
p fibs_rec(4)
p fibs_rec(5)
p fibs_rec(6)
p fibs_rec(7)
p fibs_rec(8)
p fibs_rec(9)
p fibs_rec(10)
