module MyEnumerable
    def my_each 
        for x in self
            yield x
        end
    end
end

include MyEnumerable

[1, 2, 3, 4].my_each { |i| puts i } # => 1 2 3 4
[1, 2, 3, 4].my_each { |i| puts i * 10 } # => 10 20 30 40