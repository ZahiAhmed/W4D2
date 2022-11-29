require_relative "employee"

class Manager < Employee
    attr_reader :employees
    def initialize(name, title, salary, boss)
        super()
        @employees = []
    end

    def bonus(multiplier)
        total_salary = 0
        self.employees.each do |employee|
            total += employee.salary
        end
        total_salary * multiplier
    end
end