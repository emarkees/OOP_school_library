# ./classes/capitalize_decorator.rb
require './classes/base_decorator'

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end
