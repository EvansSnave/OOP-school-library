require 'rspec'
require_relative '../lib/rental'
require_relative '../lib/book'
require_relative '../lib/person'
require_relative '../lib/student'
require_relative '../lib/teacher'

describe Rental do
  let(:book) { Book.new('The Great Gatsby', 'F. Scott Fitzgerald') }
  let(:person) { Person.new('John Doe') } # Adjust with actual Person class initialization if needed
  let(:rental) { Rental.new('2023-09-22', person, book) }

  describe '#initialize' do
    it 'creates a rental with a date, person, and book' do
      expect(rental.date).to eq('2023-09-22')
      expect(rental.person).to eq(person)
      expect(rental.book).to eq(book)
    end

    it 'adds the rental to the person and book rentals' do
      expect(person.rentals).to include(rental)
      expect(book.rentals).to include(rental)
    end
  end

  describe '.json_create' do
    it 'creates a rental from a hash' do
      hash = {
        'date' => '2023-09-22',
        'person' => { 'name' => 'John Doe', 'age' => 30, 'id' => '1', 'parent_permission' => true },
        'book' => { 'title' => 'The Great Gatsby', 'author' => 'F. Scott Fitzgerald' }
      }

      created_rental = Rental.json_create(hash)

      expect(created_rental.date).to eq('2023-09-22')
      expect(created_rental.person.name).to eq('John Doe')
      expect(created_rental.book.title).to eq('The Great Gatsby')
    end
  end
end
