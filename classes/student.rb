require_relative 'person'
require_relative 'classroom'
require 'json'

class Student < Person
  def initialize(age, name, parent_permission: true, id: Random.rand(1..1000))
    super(age, name, parent_permission: parent_permission, id: id)
  end

  attr_reader :classroom

  def classroom=(classroom)
    @classroom = classroom
    classroom.add_student(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def to_json(*_args)
    json_data = {
      'json_class' => self.class.name,
      'id' => @id,
      'name' => @name,
      'age' => @age,
      'parent_permission' => @parent_permission
    }
    json_data['classroom'] = @classroom if @classroom
    json_data.to_json
  end

  def self.json_create(object)
    student = new(object['age'], object['name'], parent_permission: object['parent_permission'], id: object['id'])
    student.classroom = object['classroom'] if object['classroom']
    student
  end
end
