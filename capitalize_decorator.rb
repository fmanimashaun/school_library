# frozen_string_literal: true

require './decorator'

# create capitalization decorator that returns a capitalized name
class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end
