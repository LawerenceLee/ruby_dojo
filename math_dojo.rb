class MathDojo
    attr_accessor :result
    def initialize
        @result = 0
    end

    def add *args
        for arg in args
            if arg.class == Fixnum || arg.class == Float
                @result += arg
            elsif arg.class == Array
                arg.each { |num| @result += num}
            end
        end
        return self
    end

    def subtract *args
        for arg in args
            if arg.class == Fixnum || arg.class == Float
                @result -= arg
            elsif arg.class == Array
                arg.each { |num| @result -= num}
            end
        end
        return self
    end

    def result
        puts @result
        return self
    end
end

challenge1 = MathDojo.new.add(2).add(2, 5).subtract(3, 2).result
challenge2 = MathDojo.new.add(1).add([3, 5, 7, 8], [2, 4.3, 1.25]).subtract([2,3], [1.1, 2.3]).result
