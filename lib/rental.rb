class Rental
  attr_accessor :date, :person, :book

  def initialize(date, person, book)
    @date = date
    @person = person
    person.rentals << self

    @book = book
    # *The rental is adding itself to the @book achieving the 'belongs-to' association
    book.rentals << self
  end
end
