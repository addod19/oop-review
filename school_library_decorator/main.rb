#!/usr/bin/ruby

require './book'
require './classroom'
require './person'
require './rental'
require './student'
require './teacher'

@books = []
@people = []
@rentals = []

def list_books
  @books.each do |book|
    puts "Title: \"#{book.title}\", Author: #{book.author}"
  end
end

def list_people
  @people.each do |person|
    puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end
end

def create_person # rubocop:disable Metrics/MethodLength
  puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '

  student_teacher_option = gets.chomp

  if student_teacher_option != '1' && student_teacher_option != '2'
    puts 'Invalid option'
    return
  end

  puts 'Age: '
  age = gets.chomp

  puts 'Name: '
  name = gets.chomp

  case student_teacher_option.to_i
  when 1
    puts 'Has parent permission? [Y/N]: '
    permission = gets.chomp

    @people << Student.new(age, name, permission)
  when 2
    puts 'Specialization: '
    specialization = gets.chomp

    @people << Teacher.new(age, name, specialization)
  else
    p 'Oooooopsssss!!!! wrong option'
  end

  puts 'Person created successfully'
end

def create_book
  puts 'Title: '
  title = gets.chomp

  puts 'Author: '
  author = gets.chomp

  @books << Book.new(title, author)

  puts 'Book created successfully'
end

def create_rental
  puts 'Select a book from the following list by number'

  @books.each_with_index do |book, index|
    puts "#{index}) Title \"#{book.title}\", Author: #{book.author}"
  end

  book_index = gets.chomp.to_i

  puts "\nSelect a person from the following list by number (not id)"
  @people.each_with_index do |person, index|
    puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end

  person_index = gets.chomp.to_i

  puts "\Date: "
  date = gets.chomp

  @rentals << Rental.new(date, @books[book_index], @people[person_index])
  puts 'Rental created successfully'
end

def list_all_rentals_for_person_id
  puts 'ID of person'
  id = gets.chomp.to_i

  rentals = @rentals.filter { |rental| rental.person.id == id }
  puts 'Rentals: '

  rentals.each do |rental|
    puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
  end
end

def app_exit(_option)
  'Thank you for using this app'
end

option = nil

while option != 7
  puts "Please choose any option by entering a number:\n
    1 - List all books \n 2 - List all people \n 3 - Create a person \n
    4 - Create a book \n 5 - Create a rental \n 6 - List all rentals for a given person id \n
    7 - Exit"
  option = gets.chomp

  case option
  when '1'
    list_books
  when '2'
    list_people
  when '3'
    create_person
  when '4'
    create_book
  when '5'
    create_rental
  when '6'
    list_all_rentals_for_person_id
  when '7'
    app_exit(option)
  end

  puts "\n"
end
