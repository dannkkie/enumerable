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
end