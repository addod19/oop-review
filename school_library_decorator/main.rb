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
        
    end

    def list_people

    end

    def create_person
        puts "Do you want to create a student (1) or a teacher (2)? [Input the number]: "
        
        student_teacher_option = gets.chomp
    
        if student_teacher_option.to_i === 1
            puts "Age: "
            student_age = gets.chomp
    
            puts "Name: "
            student_name = gets.chomp
    
            puts "Has parent permission? [Y/N]: "
            student_permission = gets.chomp
    
            new_person = Person.new(student_age, student_name)
            p new_person
            
            p "Person created successfully!!!!"
        elsif student_teacher_option.to_i === 2
            puts "Age: "
            teacher_age = gets.chomp
    
            puts "Name: "
            teacher_name = gets.chomp
    
            puts "Specialization: "
            teacher_specialization = gets.chomp
    
            new_person = Teacher.new(teacher_age, teacher_name)
            p new_person
            p "Person created successfully"
        else
            p "Oooooopsssss!!!! wrong option"
        end
    end

    def create_book

    end

    def create_rental

    end

    def list_all_rentals_for_person_id

    end

    def list_all_books

    end
end








puts "Please choose any option by entering a number:\n 1 - List all books \n 2 - List all people \n 3 - Create a person \n 4 - Create a book \n 5 - Create a rental \n 6 - List all rentals for a given person id \n 7 - Exit"
option = gets.chomp

if option.to_i === 1
    p "list books"
elsif option.to_i === 2
    p "list all people"
elsif option.to_i === 3
    create_person
elsif option.to_i === 4
    p "create book"
elsif option.to_i === 5
    p "create rental"
elsif option.to_i === 6
    p "list all rentals with a given person id"
elsif option.to_i === 7
    p "exit"
else
    p "option error!!!! Ooooooops!!!"
end