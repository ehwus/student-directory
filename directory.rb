class StudentList
  attr_reader :students

  def initialize
    @students = []
  end

  def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # create empty array
    # get the first name
    name = gets.chomp
    # while the name is not empty, repeat this code
    until name.empty?
      puts "What is their country of birth?"
      country_of_birth = gets.chomp
      # add the student hash to the array
      students << {name: name, cohort: :november, country: country_of_birth}
      puts "Now we have #{students.count} students"
      # get another name from the user
      name = gets.chomp
    end
    # return array of students
    students
  end

  # print the list of students
  def print_header
    puts "The students of Villians Academy"
    puts "-----------------"
  end

  def print_students
    students.each_with_index do |student, index|
      puts "Student #{index + 1}: #{student[:name]} (#{student[:cohort]} cohort)"
      puts "They were born in #{student[:country]}"
    end
  end

  def print_footer
    puts "Overall, we have #{students.count} great students"
  end
end

students = StudentList.new
students.input_students
students.print_header
students.print_students
students.print_footer