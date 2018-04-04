require_relative "human"
class Ninja < Human
    def initialize
        super
        @stealth = 175
        self
    end

    def steal(obj)
        attack(obj)
        @health += 10
        self
    end

    def get_way
        @health -= 15
        self
    end
end