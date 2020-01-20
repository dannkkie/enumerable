module Enumerable
    #this is the my_each method
    def my_each
        i = 0
        while i < self.size
            yield(self[i])
            i += 1
        end 
        self
    end

    def my_each_with_index
		i = 0
		while i < self.size
			yield(self[i], i)
			i+= 1
		end
		self
    end
    
    def my_select
		selected = []
		self.my_each { |i| selected << i if yield(i) }
		selected
    end
    
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
    
    def my_any? 
		boolean = false
		self.my_each {|i| boolean = true if yield(i)}
		boolean
    end
    
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
    
    def my_count
		num = 0
		if block_given?
			self.my_each  { |i| num += 1 if yield(i) }
		else
			self.my_each {|i| num += 1}
		end
		num
    end
    
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
    
    def my_inject(args = nil)
		total = args.nil? ? self[0] : args
		self.my_each {|i| total = yield(total, i)}
		total
	end
end