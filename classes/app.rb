require_relative 'person'
require_relative 'book'
require_relative 'rental'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_all_books
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def list_all_people
    @people.each { |person| puts "#{person.class}: ID: #{person.id}, Name: #{person.name}" }
  end

  def create_person(name, age, type, parent_permission: true)
    if type == 'teacher'
      person = Teacher.new(name, age)
    elsif type == 'student'
      person = Student.new(name, age, parent_permission: parent_permission)
    else
      raise "Invalid person type. Use 'teacher' or 'student'."
    end

    @people << person
    person
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books << book
    book
  end

  def create_rental(date, book_id, person_id)
    book = @books.find { |b| b.object_id == book_id }
    person = @people.find { |p| p.object_id == person_id }

    raise "Book not found" if book.nil?
    raise "Person not found" if person.nil?

    rental = Rental.new(date, book, person)
    @rentals << rental
    rental
  end

  def list_rentals_for_person(person_id)
    person = @people.find { |p| p.object_id == person_id }

    raise "Person not found" if person.nil?

    person_rentals = @rentals.select { |rental| rental.person == person }
    person_rentals.each do |rental|
      puts "Rental Date: #{rental.date}, Book: #{rental.book.title}, Author: #{rental.book.author}"
    end
  end
end
