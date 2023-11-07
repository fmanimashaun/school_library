# frozen_string_literal: true

require './person'

# Student class
# The Student class represents a student in a school.
# The student has a name, age, and grade.
# The student inherits from Person class.
class Student < Person
  def initialize(name, age, classroom)
    super(name, age)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
