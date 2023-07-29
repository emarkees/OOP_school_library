require_relative 'app'

def main
  app = App.new

  loop do
    puts "\nOptions:"
    puts "1. List all books"
    puts "2. List all people"
    puts "3. Create a person"
    puts "4. Create a book"
    puts "5. Create a rental"
    puts "6. List rentals for a person"
    puts "7. Quit"

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
      print "Enter person's name: "
      name = gets.chomp
      print "Enter person's age: "
      age = gets.chomp.to_i
      print "Enter person type (teacher or student): "
      type = gets.chomp.downcase
      if type == 'student'
        print "Does the student have parent permission? (true or false): "
        parent_permission = gets.chomp.downcase == 'true'
      else
        parent_permission = true
      end
      person = app.create_person(name, age, type, parent_permission: parent_permission)
      puts "#{person.class} created with ID: #{person.id}, Name: #{person.name}"
    when 4
      print "Enter book's title: "
      title = gets.chomp
      print "Enter book's author: "
      author = gets.chomp
      book = app.create_book(title, author)
      puts "Book created with Title: #{book.title}, Author: #{book.author}"
    when 5
      print "Enter rental date (YYYY-MM-DD): "
      date = Date.parse(gets.chomp)
      puts "Available books:"
      app.list_all_books
      print "Enter book ID to rent: "
      book_id = gets.chomp.to_i
      puts "Available people:"
      app.list_all_people
      print "Enter person ID to create rental: "
      person_id = gets.chomp.to_i
      app.create_rental(date, book_id, person_id)
      puts "Rental created."
    when 6
      puts "Available people:"
      app.list_all_people
      print "Enter person ID to list rentals: "
      person_id = gets.chomp.to_i
      puts "Rentals for the selected person:"
      app.list_rentals_for_person(person_id)
    when 7
      puts "Goodbye!"
      break
    else
      puts "Invalid option. Please choose a valid option (1-7)."
    end
  end
end

# Call the main method to start the app
main
