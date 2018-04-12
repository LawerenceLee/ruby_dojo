class Project
    attr_accessor :name, :description, :owner, :tasks
    def initialize name, description, owner, tasks=[] 
      @name = name
      @description = description
      @owner = owner
      @tasks = tasks
    end

    def elevator_pitch
      "#{@name}, #{@description}"
    end

    def add_task task
      @tasks.push(task)
    end
    
    def get_tasks
      @tasks
    end

    def print_tasks
      puts @tasks
    end

  end