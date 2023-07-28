class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def rental(date, person)
    rental = Rental.new(date, self, person)
    @rentals << rental
    person.rentals << rental
    rental
  end
end
