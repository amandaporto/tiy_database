require_relative "person"
require_relative "employee"
require_relative "student"

class Menu
  CHOICES = ["a", "s", "d", "q"]
  people = []
  def display
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
        exit
      end
    end  until CHOICES.include?(menu_choice)
  end

  def add
  puts "[S]tudent or [E]mployee?"
  person_type = gets.chomp.downcase
    if person_type == "s"
      puts "Name?"
      student_name = gets.chomp.downcase
      student_name = Student.new
      people << student_name
      student_name.name = student_name
        if people.include?(student_name)
          puts "#{name} is already in the database."
        end
      puts "Phone?"
      student_name.phone = gets.chomp
      puts "Address?"
      student_name.address = gets.chomp
      puts "Github?"
      student_name.github = gets.chomp.downcase
      puts "Slack?"
      student_name.slack = gets.chomp.downcase
    elsif person_type == "e"
      puts "Name?"
      employee_name = gets.chomp.downcase
      employee_name = Employee.new
      people << employee_name
      employee_name.name = employee_name
        if people.include?(student_name)
          puts "#{name} is already in the database."
        end
      puts "Phone?"
      employee_name.phone = gets.chomp
      puts "Address?"
      employee_name.address = gets.chomp
      puts "Github?"
      employee_name.github = gets.chomp.downcase
      puts "Slack?"
      employee_name.slack = gets.chomp.downcase
      puts "Salary?"
      employee_name.salary = gets.chomp
      puts "Position?"
      employee_name.position = gets.chomp.downcase
      puts "Date Hired?"
      employee_name.date_hired = gets.chomp
    else
      puts "Not a valid choice."
    end
  end

  def search
    puts "Name to search?"
    search_name = gets.chomp.downcase
      if people.include?(search_name)
        puts search_name.inspect
      else
        puts "#{search_name} not found in database."
      end
  end

  def delete
    puts "Name to delete?"
    delete_name = gets.chomp.downcase
      if people.include?(delete_name)
        puts "#{delete_name} will be deleted from database."
        people.delete(delete_name)
      else
        puts "#{delete_name} not found in database."
      end
  end
end
