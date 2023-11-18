require_relative 'basedecorator'

class TrimDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name[0..9]
  end
end
