# The Person class represents a person with an id, name, and age.
# The id is a unique identifier for the person.
# The name is the name of the person.
# The age is the age of the person.
class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name: 'unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    @parent_permission || of_age?
  end

  private

  def of_age?
    @age >= 18
  end
end