require_relative 'person'

class Book
  # *Getters and Setters for @rentals should be present
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  # *A method for adding rentals should be present. Link to the example in a previous lesson: https://github.com/microverseinc/curriculum-ruby/blob/main/oop/articles/oop_relationships_by_examples.md#many-to-many-relationship
  def add_rental(person, date)
    # *the book itself should be sent as a parameter to create the new rental achieving the 'has-many' association.
    Rental.new(date, self, person)
  end
end
