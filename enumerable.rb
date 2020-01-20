# frozen_string_literal: true

module Enumerable
    # this is the my_each method
  def my_each
    i = 0
      while i < self.size
        yield(self[i])
          i += 1
      end 
      self
  end

     # this is the my_each_with_index method
  def my_each_with_index
	i = 0
	  while i < self.size
	    yield(self[i], i)
		  i+= 1
	  end
	  self
  end
    
     # this is the my_select method
  def my_select
	selected = []
	self.my_each { |i| selected << i if yield(i) }
	selected
  end
    
     # this is the my_all method
  def my_all? 
	boolean = true
	self.my_each  do |i| 
	boolean = false unless yield(i) 
	  if boolean == false
		break
	  end
    end
	boolean 
  end
    
     # this is the my_any method
  def my_any? 
	boolean = false
	self.my_each {|i| boolean = true if yield(i)}
	boolean
  end
    
     # this is the my_none method
  def my_none?
	boolean = true
	self.my_each do|i| 
	  boolean = false if yield(i)
	  if boolean == false
		break
	  end
    end
	boolean
  end
    
     # this is the my_count method
  def my_count
	num = 0
	if block_given?
	  self.my_each  { |i| num += 1 if yield(i) }
	else
	  self.my_each {|i| num += 1}
	end
	num
  end
    
     # this is the my_map method
  def my_map(&proc)
	new_array = []
	if proc
	  self.my_each {|i| new_array << proc.call(i)}
	  new_array
	else
	  self.my_each {|i| new_array << yield(i)}
	  new_array
	end
  end
    
     # this is the my_inject method
  def my_inject(args = nil)
	total = args.nil? ? self[0] : args
	self.my_each {|i| total = yield(total, i)}
	total
  end
end

    # this is the multiply_els method
  def multiply_els(array)
    array.my_inject(1) {|product, i| product * i}
  end
