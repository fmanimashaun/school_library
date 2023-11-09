require './decorator'

# create trimmerDecorator decorator that returns a trimmed name
class TrimmerDecorator < Decorator
  def correct_name
    @nameable.correct_name.size > 10 ? @nameable.correct_name[0..9] : @nameable.correct_name
  end
end
