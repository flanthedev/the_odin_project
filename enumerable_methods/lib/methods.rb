#other students work with slight refactor for learning purpose

module Enumberable

def my_each
  return to_enum(:my_each) unless block_given?

  if self.is_a? Hash
    for key in self.keys
      yield(key, self[key])
    end
  else # self is array
    for elem in self
      yield(elem)
    end
  end
end

def my_each_with_index
  return to_enum(:my_each_with_index) unless block_given?
  index = 0
  if self.is_a? Hash
    for key in self.keys
      yield(key, self[key], index)
      index += 1
    end
  else
    for elem in self
      yield(elem, index)
      index += 1
    end
  end
end

def my_select
  return to_enum(:my_select) unless block_given?

  if self.is_a? Hash
    result = {}
    my_each { |i, j| result[k] = v if yield(k,v) }
  else
    result = []
    my_each { |elem| result << elem if yield(elem) }
    end
  end
end

def my_all?
  if self.is_a? Hash && block_given?
    my_each { |i, j| return false unless yield(i, j) }
  else
    if block_given?
      my_each { |elem| return false unless yield(elem) }
    else
      my_each { |elem| return false if elem == false || elem.nil? }
    end
  end
true
end

def my_any?
  if self.is_a? Hash
    if block_given?
      my_each { |i, j| return true if yield(i, j) }
    else
      return true unless self.empty?
    end
  else
    if block_given?
      my_each { |elem| return true if yield(elem) }
    else
      my_each { |elem| return true unless elem == false || elem.nil? }
    end
  end
false
end

def my_none?
  if self.is_a? Hash
    if block_given?
      my_each { |i, j| return false if yield(i, j) }
    else
      return false unless self.empty?
    end
  else
    if block_given?
      my_each { |elem| return false if yield(elem) }
    else
      my_each { |elem| return false unless elem == false || elem.nil? }
    end
  end
  true
end

def my_count
  return to_enum(:my_count) unless block_given?
  count = 0
  if self.is_a? Hash
    my_each { |i, j| count += 1 }
  else
    count = 0
    my_each { |elem| count += 1 }
  end
  return count
end





end
