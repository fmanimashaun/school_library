require_relative 'person'
require 'json'

class Teacher < Person
  def initialize(age, specialization, name = 'unknown', id: Random.rand(1..1000))
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
      'specialization' => @specialization
    }.to_json
  end

  def self.json_create(object)
    new(object['age'], object['specialization'], object['name'], id: object['id'])
  end
end
