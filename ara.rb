# frozen_string_literal: true

# my enumerable
module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    each do |i|
      yield i
    end
  end
  end
# ([1, 2, 3, 4, 5]).my_each { |n| p  "Current number is: #{n}" }
# (1..5).each { |n| p  "Current number is: #{n}" }
# p (1..5).each { |n| "Current number is: #{n}" } ==  (1..5).my_each { |n|  "Current number is: #{n}" }
def my_each_with_index
  return to_enum(:my_each_with_index) unless block_given?

  if block_given?
    i = 0
    while i <= size
      yield(self[i], i)
      i += 1
    end
  end
end
[1, 2, 3, 4, 5].my_each_with_index { |n, i| print "Number is: #{n}, Index is: #{i}" }
(1..5).each_with_index { |n, i| print "Number is: #{n}, Index is: #{i}" }
print (1..5).each_with_index { |n, i| "Number is: #{n}, Index is: #{i}" } == (1..5).my_each_with_index { |n, i| "Number is: #{n}, Index is: #{i}" }
