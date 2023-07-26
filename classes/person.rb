class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  # Gett methods
  attr_reader :id
  attr_accessor :name, :age

  # Private method
  private

  def of_age?
    @age >= 18
  end

  # Public method
  public

  def can_use_service
    of_age? || @parent_permission
  end
end