require_relative 'nameable'

class Person
  def initialize(age, name = 'Unknown', parent_permision: true)
    @id = 0
    @name = name
    @age = age
    @parent_permision = parent_permision
  end
  attr_reader :id
  attr_accessor :name, :age

  def can_use_service?
    return false unless of_age? || parent_permision

    true
  end

  private

  def of_age?
    return false unless age >= 18

    true
  end
end
