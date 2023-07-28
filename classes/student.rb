require_relative 'Person'

class Student < Person
  attr_reader :classroom

  def initialize(id, age, classroom, name = 'Unknown', parent_permission: true)
    super(id, age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
