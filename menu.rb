require_relative "person.rb"
require_relative "employee.rb"
require_relative "student.rb"

action = ["A", "S", "D", "Q"]
begin
  puts "TIY Database: [A]dd, [S]earch, [D]elete, or [Q]uit"
  database_action = gets.chomp.downcase
end  until action.include?(databse_action)

case database_action
  when "A"
    puts "Please enter name"
    name = gets.chomp.downcase

  when "S"
    puts "Please enter name"
    name = gets.chomp.downcase
    
  when "D"
    puts "Please enter name"
    name = gets.chomp.downcase

  when "Q"
    exit
end
