# frozen_string_literal: true

# The class Classroom represents a classroom. It holds a label and a list of students.
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
end
