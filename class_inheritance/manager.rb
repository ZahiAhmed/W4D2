require_relative "employee"

class Manager < Employee
    attr_reader :employees
    def initialize(name, title, salary, boss)
        super
        @employees = []
    end

    def add_employee(employee)
        if self == employee.boss
            @employees << employee
        end 
    end

    def bonus(multiplier)
        total_salary = 0
        self.employees.each do |employee|
            total += employee.salary
        end
        total_salary * multiplier
    end
end

ned = Manager.new("Ned", 1000000, "Founder", nil)
darren = Manager.new("Darren", 78000, "TA Manager", "Ned")
shawna = Employee.new("Shawna", 12000, "TA", "Darren")
david = Employee.new("David", 10000, "TA", "Darren")

ned.add_employee(darren)
darren.add_employee(shawna)
darren.add_employee(david)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000