# ./classes/trimmer_decorator.rb
require './classes/base_decorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.strip
  end
end
