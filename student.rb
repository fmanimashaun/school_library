require './person'
require './classroom'

class Student < Person
  def initialize(age, name, parent_permission: true)
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
