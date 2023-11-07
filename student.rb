require './person'

# Student class
# The Student class represents a student in a school.
# The student has a name, age, and classroom.
# The student inherits from Person class.
class Student < Person
  def initialize(name, age, parent_permission, classroom)
    super(name, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
