require_relative 'person'
require 'json'

class Teacher < Person
  def initialize(age, name, specialization, id: Random.rand(1..1000))
    super(age, name, id: id)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_json(*_args)
    {
      'json_class' => self.class.name,
      'id' => @id,
      'name' => @name,
      'age' => @age,
      'parent_permission' => @parent_permission,
      'specialization' => @specialization
    }.to_json
  end

  def self.json_create(object)
    new(object['age'], object['name'], parent_permission: object['parent_permission'],
                                       specialization: object['specialization'], id: object['id'])
  end
end
