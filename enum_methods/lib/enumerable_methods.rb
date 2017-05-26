module Enumerable

  def my_each

    return self.to_enum unless block_given?

    if self.is_a? Hash
      for key in self.keys
        yield(key, self[key])
      end
    elsif self.empty?
      return []
    else #array
      for x in self
        output =[]
        #self.length.times { |i| output << yield(self[i]) }
        #self.length.times { |i| yield(self[i]) }
        output << yield(self[x])
      end
      #return [] if Array.empty?
      return output
    end
  end

  def my_each
    if self.class == Array
      for i in 0..size - 1
        yield (self[i])
      end
    elsif self.class == Hash
      keys = self.keys
      for i in 0..keys.size - 1
        yield [keys[i], self[keys[i]]]
      end
    end
  end




  def my_select
    return self.to_enum unless block_given?
    if self.is_a? Hash
      output = {}
      my_each { |k, v| output[k] = v if yield(k,v) }
    else # self is array
      output = []
      my_each { |elem| output << elem if yield(elem) }
    end
    return output
  end



end
