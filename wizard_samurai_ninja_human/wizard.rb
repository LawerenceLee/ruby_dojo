require_relative "human"
class Wizard < Human
    def initialize
        super
        @health = 50
        @intellegence = 25
    end

    def heal
        @health += 10
        self
    end

    def fireball(obj)
        obj.health -=20
        self
    end
end

wiz = Wizard.new