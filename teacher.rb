require './person'

# The Teacher class represents a teacher
# in a school. The teacher has a name, age,
# and specialization. The teacher inherits
# from the Person class.
# The teacher can use the services that
class Teacher < Person
  def initialize(age, name, specialization)
    super(age, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
