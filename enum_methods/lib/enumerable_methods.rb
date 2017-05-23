module Enumerable

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

  def my_select
    return to_enum(:my_select) unless block_given?

    if self.is_a? Hash
      new_collection = {}
      my_each { |k, v| new_collection[k] = v if yield(k,v) }
    else # self is array
      new_collection = []
      my_each { |elem| new_collection << elem if yield(elem) }
    end

    new_collection
  end

end
