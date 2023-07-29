require_relative 'app'

def main
  app = App.new
  app.start_app
end

def list_of_options
  puts
  puts 'Please choose an option by entering a number:'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a renter'
  puts '6 - List all renters for a given person id'
  puts '7 - Exit'
end

def option(input)
  case input
  when '1'
    list_all_book
  when '2'
    list_all_persons
  when '3'
    create_person
  when '4'
    create_book
  when '5'
    create_rental
  when '6'
    list_all_rentals
  else
    puts 'Select from the above option by entering any of the listed number'
  end
end

main
