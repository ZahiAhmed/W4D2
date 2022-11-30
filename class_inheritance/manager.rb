require_relative "employee"
require "byebug"
class Manager < Employee
    attr_reader :employees
    def initialize(name, title, salary, boss)
        super
        @employees = []
    end

    def add_employee(employee)
        if self.name == employee.boss
            @employees << employee
        end 
    end

    def bonus(multiplier)
        total_salary = 0
        self.employees.each do |employee|
            if employee.is_a?(Manager)
                total_salary += employee.salary * multiplier
            end
            total_salary += employee.bonus(multiplier)
        end
        total_salary
    end
end

ned = Manager.new("Ned", 1000000, "Founder", nil)
darren = Manager.new("Darren", 78000, "TA Manager", "Ned")
shawna = Employee.new("Shawna", 12000, "TA", "Darren")
david = Employee.new("David", 10000, "TA", "Darren")
# p ned.salary
# p darren.salary
# p shawna.salary
# p david.salary

ned.add_employee(darren)
darren.add_employee(shawna)
darren.add_employee(david)

ned.employees
darren.employees

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000