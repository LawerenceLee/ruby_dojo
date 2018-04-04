class Human

    attr_accessor :strength, :intellegence, :stealth, :health

    def initialize
        @strength = 3
        @intellegence = 3
        @stealth = 3
        @health = 100
    end

    def context
        puts self.class
        self.instance_variables.map do |attribute|
            { attribute => self.instance_variable_get(attribute) }
        end
    end

    def attack(obj)
        if obj.class.ancestors.include?(Human)
            obj.health -= 10
        end
        self
    end
end



