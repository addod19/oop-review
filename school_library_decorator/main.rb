#!/usr/bin/ruby

require './book'
require './classroom'
require './person'
require './rental'
require './student'
require './teacher'


def list_all_books

end

def list_all_people

end

def create_person
    puts "Do you want to create a student (1) or a teacher (2)? [Input the number]: "
    
    student_teacher_option = gets.chomp

    if student_teacher_option.to_i === 1
        p "Am a student"
    elsif student_teacher_option.to_i === 2
        p "Am a teacher"
    else
        p "Oooooopsssss!!!! wrong option"
    end
end
def create_book

end

def create_rental

end

def list_all_rentals_for_given_person_id

end

def list_all_books

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