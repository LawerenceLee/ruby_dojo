class Project
    attr_accessor :name, :description

    def initialize(name, description)
        @name = name
        @description = description
    end

    def elevator_pitch
        puts "#{@name}, #{@description}"
    end
end

project1 = Project.new("Project1", "Description1")
puts project1.name
project1.elevator_pitch