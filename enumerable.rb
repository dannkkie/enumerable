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
end