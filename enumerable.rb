# frozen_string_literal: true

module Enumerable
  # this is the my_each method
  def my_each
    return to_enum unless block_given?

    i = 0
    while i < size
      yield(self[i])
      i += 1
    end
    self
  end

  # this is the my_each_with_index method
  def my_each_with_index
    return to_enum unless block_given?

    i = 0
    while i < size
      yield(self[i], i)
      i += 1
    end
    self
  end

  # this is the my_select method
  def my_select
    return to_enum unless block_given?

    selected = []
    my_each { |i| selected << i if yield(i) }
    selected
  end

  # this is the my_all method
  # rubocop:disable Metrics/PerceivedComplexity,Metrics/CyclomaticComplexity
  def my_all?(param = nil)
    if block_given?
      my_each { |i| return false unless yield(i) }
    elsif param.class == Class
      my_each { |i| return false unless i.class == param }
    elsif param.class == Regexp
      my_each { |i| return false unless i =~ param }
    elsif param.nil?
      my_each { |i| return false unless i }
    else
      my_each { |i| return false unless i == param }
    end
    true
  end

  def my_any?(param = nil)
    if block_given?
      my_each { |i| return true if yield(i) }
    elsif param.class == Class
      my_each { |i| return true if i.class == param }
    elsif param.class == Regexp
      my_each { |i| return true if i =~ param }
    elsif param.nil?
      my_each { |i| return true if i }
    else
      my_each { |i| return true if i == param }
    end
    false
  end

  # this is the my_none method
  def my_none?(param = nil)
    if block_given?
      my_each { |i| return false if yield(i) }
    elsif param.class == Class
      my_each { |i| return false if i.class == param }
    elsif param.class == Regexp
      my_each { |i| return false if i =~ param }
    elsif param.nil?
      my_each { |i| return false if i }
    else
      my_each { |i| return false if i == param }
    end
    true
  end

  # this is the my_count method
  def my_count(items = nil)
    count = 0
    if block_given?
      my_each { |i| count += 1 if yield(i) == true }
    elsif items.nil?
      my_each { count += 1 }
    else
      my_each { |i| count += 1 if i == items }
    end
    count
  end

  # this is the my_map method
  def my_map(&proc)
    new_array = []
    if proc
      my_each { |i| new_array << proc.call(i) }
    else
      my_each { |i| new_array << yield(i) }
    end
  end

  # this is the my_inject method
  def my_inject(args = nil)
    total = args.nil? ? self[0] : args
    my_each { |i| total = yield(total, i) }
    total
  end
end

# this is the multiply_els method
def multiply_els(array)
  array.my_inject(1) { |product, i| product * i }
end
