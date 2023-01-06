
module Enumerable
  def my_each_with_index()
    index = 0
    my_each do |element|
      yield(element, index)
      index += 1
    end
  end

  def my_select
    arr = []
    my_each do |element|
      arr << element if yield(element)
    end
    arr
  end
end

class Array
  def my_each()
    for element in self
      yield element if block_given?
    end
  end
end


