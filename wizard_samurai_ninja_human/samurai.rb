require_relative "human"
class Samurai < Human
    @@total_samurai = 0
    def self.how_many
        puts "Total Samural: #{@@total_samurai}"
    end

    def initialize
        @@total_samurai += 1
        super
        @health = 200
    end

    def death_blow(obj)
        beings_current_health = obj.health
        obj.health -= beings_current_health
        self
    end

    def meditate
        @health = 200
        self
    end
end