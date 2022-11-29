class Employee
    attr_accessor :name, :title, :salary, :boss
    def initialize(name, salary, title, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end


    def bonus(multiplier)
        (self.salary) * multiplier
    end
end

