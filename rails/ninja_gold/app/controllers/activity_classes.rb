class Activity
    attr_accessor :text_color, :date_time

    def initialize
        @text_color = "green"
        @date_time = Time.new.strftime("%Y/%m/%d %I:%M%p")
    end

    def context
        puts self.class
        self.instance_variables.map do |attribute|
            { attribute => self.instance_variable_get(attribute) }
        end
    end

end


class Farm < Activity
    attr_accessor :gold_earned, :activity_str

    def initialize
        super
        @gold_earned = rand(10..20)
        @activity_str = "Earned #{@gold_earned} golds from the Farm! (#{@date_time})" 
    end

end


class Cave < Activity
    attr_accessor :gold_earned, :activity_str

    def initialize
        super
        @gold_earned = rand(5..10)
        @activity_str = "Earned #{@gold_earned} golds from the Cave! (#{@date_time})" 
    end

end


class House < Activity
    attr_accessor :gold_earned, :activity_str

    def initialize
        super
        @gold_earned = rand(2..5)
        @activity_str = "Earned #{@gold_earned} golds from the House! (#{@date_time})" 
    end

end


class Casino < Activity

    attr_accessor :gold_earned, :activity_str

    def initialize
        super
        @gold_earned = rand(-50..50)
        if @gold_earned > 0
            @earned_lost = ['earned', 'WOW']
        else
            @earned_lost = ['lost', 'Ouch']
            @text_color = 'red'
        end

        @activity_str = "Entered a casino and #{@earned_lost[0]} #{@gold_earned.abs} golds... #{@earned_lost[1]}.. (#{@date_time})"

    end

end

# a = Activity.new
# puts a.context
b = Farm.new
puts b.context
