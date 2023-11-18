require 'rspec'
require_relative '../lib/book'
require_relative '../lib/rental'

describe Book do
  let(:book) { Book.new('The Great Gatsby', 'F. Scott Fitzgerald') }
  let(:person) { Person.new('John Doe') } # Adjust with actual Person class initialization if needed

  describe '#initialize' do
    it 'creates a book with a title and author' do
      expect(book.title).to eq('The Great Gatsby')
      expect(book.author).to eq('F. Scott Fitzgerald')
    end

    it 'initializes rentals as an empty array' do
      expect(book.rentals).to eq([])
    end
  end

  describe '#add_rental' do
    it 'adds a new rental to the book' do
      date = '2023-09-22'
      rental = book.add_rental(person, date)

      expect(book.rentals).to include(rental)
    end
  end

  describe '.json_create' do
    it 'creates a book from a hash' do
      hash = { 'title' => 'The Great Gatsby', 'author' => 'F. Scott Fitzgerald', 'rentals' => [] }
      created_book = Book.json_create(hash)

      expect(created_book.title).to eq('The Great Gatsby')
      expect(created_book.author).to eq('F. Scott Fitzgerald')
      expect(created_book.rentals).to eq([])
    end
  end
end
