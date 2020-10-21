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

  def print_menu
    puts '1 - Input the students'
    puts '2 - Show the students'
    puts '9 - Exit'
  end

  def interactive_menu
    loop do
      print_menu
      selection = gets.chomp
      case selection
      when '1'
        input_students
      when '2'
        print_header
        print_students if @students.count.positive?
        print_footer
        puts
      when '9'
        exit
      else
        puts "I don't know what you meant, try again"
      end
    end
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
    # find out active cohorts
    active_cohorts = students.map { |student| student[:cohort] }.uniq

    active_cohorts.each do |cohort|
      students.each_with_index do |student, index|
        next unless student[:cohort] == cohort

        puts "Student #{index + 1}: #{student[:name]} (#{student[:cohort]} cohort)"
        puts "They were born in #{student[:country]}, and enjoy #{student[:hobby].downcase}"
        puts
      end
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
students.interactive_menu
