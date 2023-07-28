require_relative 'student'

class Classroom
  attr_accessor :label, :students

  def initialize(label)
    @label = label
  end

  def add_student(student)
    @students << student
    student.classroom = self
  end
end
