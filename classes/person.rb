# ./classes/person.rb
require_relative 'nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    super()
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  def rental(date, book)
    rental = Rental.new(date, book, self)
    @rentals << rental
    book.rentals << rental
    rental
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_service
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end
end
