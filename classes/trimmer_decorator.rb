# ./classes/trimmer_decorator.rb
require './classes/base_decorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    trim_name = @nameable.correct_name.slice(0, 10)
    trim_name.length == 10 ? trim_name : "#{trim_name}#{'.' * (10 - trim_name.length)}"
  end
end
