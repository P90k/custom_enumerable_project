
module Enumerable
  def my_each_with_index(index=0)
    for i in self
      yield(i, index)
      index += 1
    end
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each()
    for i in self
      yield i if block_given?
    end
  end
end
