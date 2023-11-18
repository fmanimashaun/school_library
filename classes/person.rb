require './nameable'
require './rental'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def initialize(age, name = 'unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    @parent_permission || of_age?
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  def to_hash
    {
      'id' => @id,
      'name' => @name,
      'age' => @age,
      'parent_permission' => @parent_permission
    }
  end

  def self.json_create(object)
    new(object['age'], object['name'], parent_permission: object['parent_permission']).tap do |instance|
      instance.instance_variable_set(:@id, object['id'])
    end
  end

  private

  def of_age?
    @age >= 18
  end
end
