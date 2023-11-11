require './person'
require './classroom'

# Student class
# The Student class represents a student in a school.
# The student has a name, age, and classroom.
# The student inherits from Person class.
class Student < Person
  def initialize(age, name, parent_permission = true)
    super(age, name, parent_permission: parent_permission)
  end

  attr_reader :classroom

  def classroom=(classroom)
    @classroom = classroom
    classroom.add_student(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
