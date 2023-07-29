require 'date'
require_relative 'app'
require_relative 'teacher'

def main
  app = App.new

  loop do
    puts "\nOptions:"
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List rentals for a person'
    puts '7. Quit'

    print "\nEnter your choice (1-7): "
    choice = gets.chomp.to_i

    case choice
    when 1
      puts "\nList of all books:"
      app.list_all_books
    when 2
      puts "\nList of all people:"
      app.list_all_people
    when 3
      print 'Do you want to create a student (1) or teacher (2) [input the number]: '
      type = gets.chomp.to_i
      unless [1, 2].include?(type)
        puts 'Invalid person type. Please use "1" for Student or "2" for Teacher.'
        next
      end
      print "Enter person's age: "
      age = gets.chomp.to_i
      print "Enter person's name: "
      name = gets.chomp

      if type == 1
        print 'Does the student have parent permission? [Y/N]: '
        parent_permission_input = gets.chomp.downcase
        parent_permission = parent_permission_input == 'y'
        if parent_permission
          print "Enter student's classroom: "
          classroom = gets.chomp
        else
          classroom = nil
        end
        person = app.create_person(name, age, type, parent_permission: parent_permission, classroom: classroom)
      else
        print "Enter teacher's specialization: "
        specialization = gets.chomp
        person = app.create_person(name, age, type, parent_permission: true, specialization: specialization)
      end

      puts "#{person.class} created with ID: #{person.id}, Name: #{person.name}"

    when 4
      print "Enter book's title: "
      title = gets.chomp
      print "Enter book's author: "
      author = gets.chomp
      book = app.create_book(title, author)
      puts "Book created with Title: #{book.title}, Author: #{book.author}"
    when 5
      puts 'Select a book from the following list by numberggg:'
      app.list_all_books.each_with_index do |book, index|
        puts "#{index + 1}. Title: #{book.title}, Author: #{book.author}"
      end
      print 'Select a person from the following list by number: '
      person_number = gets.chomp.to_i
      selected_person = app.list_all_people[person_number - 1]

      if selected_person.nil?
        puts 'Invalid person number. Please choose a valid person from the list.'
        next
      end

      puts 'Selected person:'
      puts "#{selected_person.class}: ID: #{selected_person.id}, Name: #{selected_person.name}"

      print 'Select a book from the following list by number: '
      book_number = gets.chomp.to_i
      selected_book = app.list_all_books[book_number - 1]

      if selected_book.nil?
        puts 'Invalid book number. Please choose a valid book from the list.'
        next
      end

      print 'Enter rental date (YYYY-MM-DD): '
      begin
        date = Date.parse(gets.chomp)
      rescue ArgumentError
        puts 'Invalid date format. Please enter a valid date in the format YYYY-MM-DD.'
        next
      end

      app.create_rental(date, selected_book.object_id, selected_person.object_id)
      puts 'Rental created.'
    when 6
      puts 'ID of person:'
      app.list_rentals_for_person(person_id)
    when 7
      puts 'Goodbye!'
      break
    else
      puts 'Invalid option. Please choose a valid option (1-7).'
    end
  end
end

# Call the main method to start the app
main
