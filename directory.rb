require 'colorize'

class StudentList
  attr_reader :students
  # list of valid cohorts
  COHORTS = %i[
    january
    february
    march
    april
    may
    june
    july
    august
    september
    october
    november
    december
  ].freeze

  def initialize
    # create empty list to contain hashes of students
    @students = []
  end

  # method to get user input for the cohort a student is in
  def input_cohort
    loop do
      # take input, return it if valid and loop again if not
      puts 'Which cohort are they in? (calendar month)'
      cohort_input = gets.chomp.downcase.to_sym
      return cohort_input if COHORTS.include?(cohort_input)
    end
  end

  def input_students
    puts "Please enter the names of the students".center(100)
    puts "To finish, just hit return twice".center(100)
    # create empty array
    # get the first name
    name = gets.chomp
    # while the name is not empty, repeat this code
    until name.empty?
      puts "What is their country of birth?"
      country_of_birth = gets.chomp
      puts "What is their favourite hobby?"
      hobby = gets.chomp
      cohort = input_cohort
      # add the student hash to the array
      students << { name: name, cohort: cohort.to_s.capitalize, country: country_of_birth, hobby: hobby }
      puts "Now we have #{students.count} students"
      # get another name from the user
      name = gets.chomp
    end
    # return array of students
    students
  end

  # print the list of students
  def print_header
    puts "The students of Villians Academy".center(100).red
    puts "-----------------".center(100).blue
  end

  def print_students
    students.each_with_index do |student, index|
      puts "Student #{index + 1}: #{student[:name]} (#{student[:cohort]} cohort)"
      puts "They were born in #{student[:country]}, and enjoy #{student[:hobby].downcase}"
    end
  end

  def print_footer
    if students.count == 1
      puts "Overall, we have #{students.count} great student"
    else
      puts "Overall, we have #{students.count} great students"
    end
  end
end

students = StudentList.new
students.print_header
students.input_students
students.print_students if students.students.count > 0
students.print_footer
