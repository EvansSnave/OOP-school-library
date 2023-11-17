require_relative 'nameable'
require_relative 'basedecorator'
require_relative 'trimmerdecorator'
require_relative 'capitalizedecorator'

class Person < Nameable
  attr_accessor :name, :age, :books, :rentals
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    super(name)
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @books = []
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  # implement a method correct_name. It should simply return the name attribute.
  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end

  def add_book(book)
    @books << book
    book.person = self
  end

  def add_rental(book, date)
    # *The person itself should be sent as a parameter to create the new rental achieving the 'has-many' association
    Rental.new(date, book, self)
  end
end
