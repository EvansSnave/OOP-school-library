require 'rspec'
require_relative '../lib/teacher'

describe Teacher do
  # Use let to define variables that are used across examples
  let(:teacher) { Teacher.new(30, 'Math', 'Eve', 567) }

  # Use describe to group examples by method name
  describe '#initialize' do
    # Use it to specify an example (a test case)
    it 'creates a new teacher with the given attributes' do
      # Use expect to make assertions about the expected outcome
      expect(teacher.name).to eq('Eve')
      expect(teacher.age).to eq(30)
      expect(teacher.id).to eq(567)
      expect(teacher.specialization).to eq('Math')
      expect(teacher.can_use_services?).to be true
      expect(teacher.books).to be_empty
      expect(teacher.rentals).to be_empty
    end
  end

  describe '#can_use_services?' do
    it 'returns true for any teacher' do
      expect(teacher.can_use_services?).to be true
    end
  end

  describe '.json_create' do
    it 'creates a new teacher from a hash of attributes' do
      hash = {
        'name' => 'Frank',
        'id' => 678,
        'age' => 35,
        'specialization' => 'English',
        'books' => [],
        'rentals' => []
      }
      teacher = Teacher.json_create(hash)
      expect(teacher.name).to eq('Frank')
      expect(teacher.id).to eq(678)
      expect(teacher.age).to eq(35)
      expect(teacher.specialization).to eq('English')
      expect(teacher.books).to be_empty
      expect(teacher.rentals).to be_empty
    end
  end
end
