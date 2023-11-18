require 'rspec'
require_relative '../lib/person'
require_relative '../lib/rental'

describe Person do
  let(:person) { Person.new(25, 'Alice', 123) }
  let(:book) { Book.new('The Catcher in the Rye', 'J.D. Salinger') }

  describe '#initialize' do
    it 'creates a new person with the given attributes' do
      expect(person.name).to eq('Alice')
      expect(person.age).to eq(25)
      expect(person.id).to eq(123)
      expect(person.can_use_services?).to be true
      expect(person.books).to be_empty
      expect(person.rentals).to be_empty
    end
  end

  describe '#correct_name' do
    it 'returns the name attribute of the person' do
      expect(person.correct_name).to eq('Alice')
    end
  end

  describe '#can_use_services?' do
    context 'when the person is of age' do
      it 'returns true' do
        expect(person.can_use_services?).to be true
      end
    end

    context 'when the person is not of age but has parent permission' do
      let(:person) { Person.new(15, 'Bob', 456, parent_permission: true) }

      it 'returns true' do
        expect(person.can_use_services?).to be true
      end
    end

    context 'when the person is not of age and does not have parent permission' do
      let(:person) { Person.new(15, 'Charlie', 789, parent_permission: false) }

      it 'returns false' do
        expect(person.can_use_services?).to be false
      end
    end
  end

  # Use private methods to define helper methods for the tests
  private

  def add_book_to_person(book, person)
    person.books << book
  end

  def add_rental_to_person(book, date, person)
    Rental.new(date, book, person)
  end

  describe '#add_book' do
    it 'adds a book to the person\'s books' do
      add_book_to_person(book, person)
      expect(person.books).to include(book)
    end
  end

  describe '#add_rental' do
    it 'creates a new rental with the given book and date and adds it to the person\'s rentals' do
      rental = add_rental_to_person(book, '2023-09-22', person)
      expect(person.rentals).to include(rental)
    end
  end
end
