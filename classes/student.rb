require_relative 'person'
require_relative 'classroom'

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

  def to_h
    classroom_label = @classroom.label
    super.merge({
                  classroom: classroom_label
                })
  end
end
