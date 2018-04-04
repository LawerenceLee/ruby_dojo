class Human

    attr_accessor :strength, :intellegence, :stealth, :health

    def initialize
        @stealth = 3
        @intellegence = 3
        @stealth = 3
        @health = 100
    end

    def attack(obj)
        if obj.class.ancestors.include?(Human)
            obj.health -= 3
        end
    end
end

