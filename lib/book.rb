require_relative 'person'

class Book
  # *Getters and Setters for @rentals should be present
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
  end

  def self.json_create(hash)
    title = hash.fetch('title')
    author = hash.fetch('author')
    rentals = hash.fetch('rentals')
    book = new(title, author)
    book.rentals = rentals
    book
  end
end
