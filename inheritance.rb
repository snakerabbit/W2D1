
class Employee
  attr_accessor :salary, :name, :boss, :title
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end
end

class Manager < Employee
  attr_accessor :employees
  def initialize(name, title, salary, boss, employees)
    @employees = employees
    super(name, title, salary, boss)
  end

  def bonus(multiplier)
    return 0 if @employees.empty?
    # return (@employees.first.salary * multiplier) if @employees.count == 1

    self.sum_employee_salaries * multiplier
  end

  def sum_employee_salaries
    salaries = []
    self.employees.each do |emp|
      if emp.is_a?(Manager)
        salaries << emp.sum_employee_salaries + emp.salary
      else
        salaries << emp.salary
      end
    end

    salaries.inject(:+)
  end
end
