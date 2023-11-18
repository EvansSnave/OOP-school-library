require_relative 'nameable'
require_relative 'basedecorator'
require_relative 'trimmerdecorator'
require_relative 'capitalizedecorator'

class Person < Nameable
  attr_accessor :name, :age, :books, :rentals
  attr_reader :id

  def initialize(age, name = 'Unknown', id = nil, parent_permission: true)
    super(name)
    @id = id.nil? ? Random.rand(1..1000) : id
    @age = age
    @name = name
    @parent_permission = parent_permission
    @books = []
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

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
    Rental.new(date, book, self)
  end
end
