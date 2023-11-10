require_relative 'nameable'

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permision: true)
    super()
    @id = 0
    @name = name
    @age = age
    @parent_permision = parent_permision
    @rentals = []
  end
  attr_reader :id, :rentals
  attr_accessor :name, :age

  def can_use_service?
    return false unless of_age? || @parent_permision

    true
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    rental = Rental.new(date, self, book)
    @rentals << rental unless @rentals.includes? rental
  end

  private

  def of_age?
    return false unless @age >= 18

    true
  end
end
