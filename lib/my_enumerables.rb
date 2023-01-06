
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

  def my_all? 
    my_each do |element|
      return false unless yield(element)
    end
    true
  end

  def my_any?
    my_each {|element| return true if yield(element)}
    false
  end

  def my_none?
    my_each {|element| return false if yield(element)}
    true
  end
end

class Array
  def my_each()
    for element in self
      yield element if block_given?
    end
  end
end


