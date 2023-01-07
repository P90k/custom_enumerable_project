# frozen_string_literal: true

module Enumerable
  def my_each_with_index
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
    my_each { |element| return true if yield(element) }
    false
  end

  def my_none?
    my_each { |element| return false if yield(element) }
    true
  end

  def my_count
    count = 0
    if block_given?
      my_each { |element| count += 1 if yield(element) }
    else
      each do |_element|
        count += 1
      end
    end
    count
  end

  def my_map
    arr = []
    my_each { |element| arr << yield(element) }
    arr
  end

  def my_inject(init_operand = nil)
    if init_operand.nil?
      total = self[0]
      self[1..].my_each { |element| total = yield(total, element) }
    else
      total = init_operand
      my_each { |element| total = yield(total, element) }
    end
    total
  end
end

class Array
  def my_each
    each do |element|
      yield element if block_given?
    end
  end
end
