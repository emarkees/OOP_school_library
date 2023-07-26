require_relative 'Person'

class Teacher < Person
  def initialize(id, age, name = 'Unknown', parent_permission: true)
    super(id, age, name, parent_permission)
  end

  def can_use_services?
    true # Always returns true for teachers
  end
end
