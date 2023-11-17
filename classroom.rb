require 'json'

class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    student.classroom = self
    @students << student unless @students.include?(student)
  end

  def to_hash
    {
      'label' => @label,
      'students' => @students.map(&:id)
    }
  end
end
