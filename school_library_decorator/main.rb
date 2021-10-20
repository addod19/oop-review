#!/usr/bin/ruby

require './book'
require './classroom'
require './person'
require './rental'
require './student'
require './teacher'

class App
    def initialize
        @books = []
        @people = []
        @rentals = []
    end

    def list_books
        @books.each do |book|
            puts "Title: \"#{book.title}\", Author: #{book.author}"
        end
    end

    def list_people
        people.each do |person|
            puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        end
    end

    def create_person
        puts "Do you want to create a student (1) or a teacher (2)? [Input the number]: "
        
        student_teacher_option = gets.chomp

        if student_teacher_option != '1' && student_teacher_option != '2'
            puts "Invalid option"
            return
        end

        puts "Age: "
        age = gets.chomp
    
        puts "Name: "
        name = gets.chomp

        person = 
    
        if student_teacher_option.to_i === 1
            puts "Has parent permission? [Y/N]: "
            permission = gets.chomp
    
            Student.new(age, name, permission)
        elsif student_teacher_option.to_i === 2
            puts "Specialization: "
            specialization = gets.chomp
    
            Teacher.new(age, name, specialization)
        else
            p "Oooooopsssss!!!! wrong option"
        end

        @people << person
        puts "Person created successfully"
    end

    def create_book
        puts "Title: "
        title = gets.chomp

        puts "Author: "
        author = gets.chomp

        @books << Book.new(title, author)

        puts "Book created successfully"
    end

    def create_rental
        puts "Select a book from the following list by number"

        @books.each_with_index do |book, index|
            puts "#{index} Title \"#{book.title}\", Author: #{book.author}"
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
        puts "Rental created successfully"
    end

    def list_all_rentals_for_person_id

    end
end


app = App.new()


puts "Please choose any option by entering a number:\n 1 - List all books \n 2 - List all people \n 3 - Create a person \n 4 - Create a book \n 5 - Create a rental \n 6 - List all rentals for a given person id \n 7 - Exit"
option = gets.chomp

if option.to_i === 1
    app.list_books()
elsif option.to_i === 2
    app.list_people()
elsif option.to_i === 3
    app.create_person()
elsif option.to_i === 4
    app.create_book()
elsif option.to_i === 5
    p "create rental"
elsif option.to_i === 6
    p "list all rentals with a given person id"
elsif option.to_i === 7
    p "exit"
else
    p "option error!!!! Ooooooops!!!"
end