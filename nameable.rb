# frozen_string_literal: true

# the is a module that can be included in any class that needs a name
class Nameable
  def correct_name
    raise NotImplementedError, 'Subclasses must implement correct_name method'
  end
end
