require_relative "person"
require_relative "employee"
require_relative "student"

class Menu
  CHOICES = ["a", "s", "d", "q"]

  def initialize
    @people = []
  end

  def display
    menu_choice = ""
    while menu_choice != "q"
      begin
        puts "TIY Database: [A]dd, [S]earch, [D]elete, or [Q]uit"
        menu_choice = gets.chomp.downcase
        if menu_choice == "a"
          add
        elsif menu_choice == "s"
          search
        elsif menu_choice == "d"
          delete
        elsif menu_choice == "q"

          return
        end
      end until CHOICES.include?(menu_choice)
    end
  end

  def find_person_by_name(name)
    downcase_name = name.downcase
    @people.find {|person| person.name.downcase.include?(downcase_name)}
  end

  def add
    puts "[S]tudent or [E]mployee?"
    person_type = gets.chomp.downcase
    if person_type == "s"
      puts "Name?"
      student_name = Student.new
      student_name.name = gets.chomp
      if find_person_by_name(student_name.name)
        puts "Student already exists"
      else
        puts "Age?"
        student_name.age = gets.chomp
        puts "Phone?"
        student_name.phone = gets.chomp
        puts "Address?"
        student_name.address = gets.chomp
        puts "Github?"
        student_name.github = gets.chomp
        puts "Slack?"
        student_name.slack = gets.chomp
        puts "Scholarships?"
        student_name.scholarship = gets.chomp
        puts "#{student_name.name} has been added as a student!"
        @people << student_name
      end
    elsif person_type == "e"
      puts "Name?"
      employee_name = Employee.new
      employee_name.name = gets.chomp
      if find_person_by_name(employee_name.name)
        puts "Employee already exists"
      else
        puts "Age?"
        employee_name.age = gets.chomp
        puts "Phone?"
        employee_name.phone = gets.chomp
        puts "Address?"
        employee_name.address = gets.chomp
        puts "Github?"
        employee_name.github = gets.chomp
        puts "Slack?"
        employee_name.slack = gets.chomp
        puts "Salary?"
        employee_name.salary = gets.chomp
        puts "Position?"
        employee_name.position = gets.chomp
        puts "Date Hired?"
        employee_name.date_hired = gets.chomp
        puts "#{employee_name.name} has been added as an employee!"
        @people << employee_name
      end
    else
      puts "Not a valid choice."

      return
    end
  end

  def search
    puts "Name to search?"
    search_name = gets.chomp
    found = find_person_by_name(search_name)
    if found == nil
      puts "#{search_name} is not in the database"
    elsif found.is_a?(Student)
      puts "Name: #{found.name}\n Age: #{found.age}\n Phone: #{found.phone}\n Address: #{found.address}\n Github: #{found.github}\n Slack: #{found.slack}, Scholarhips: #{found.scholarship}"
    elsif found.is_a?(Employee)
      puts "Name: #{found.name}\n Age: #{found.age}\n Phone: #{found.phone}\n Address: #{found.address}\n Github: #{found.github}\n Slack: #{found.slack}\n Salary: #{found.salary}\n Position: #{found.position}, Date Hired: #{found.date_hired},\n Tenure: #{found.tenure}"
      puts "Has been a #{found.position} for at least #{found.tenure} years."
    end
  end

  def delete
    puts "Name to delete?"
    delete_name = gets.chomp
    deleted = find_person_by_name(delete_name)
    if deleted == nil
      puts "#{delete_name} is not in the database"
    end
    @people.delete(deleted)
    puts "#{delete_name} has been removed from database."
  end
end
