# ./classes/person.rb
class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    super()
    @age = age
    @parent_permission = parent_permission
    @name = name
    @rentals = []
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
