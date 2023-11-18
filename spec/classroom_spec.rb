require 'rspec'
require_relative '../lib/classroom' # Adjust the path to your actual file

describe Classroom do
  let(:classroom) { Classroom.new('Math') }
  let(:student) { double('Student', classroom: nil) } # Using a double for the Student object

  describe '#initialize' do
    it 'creates a classroom with a label' do
      expect(classroom.label).to eq('Math')
    end

    it 'initializes students as an empty array' do
      expect(classroom.students).to eq([])
    end
  end

  describe '#add_student' do
    it 'adds a new student to the classroom' do
      allow(student).to receive(:classroom=) # Stubbing the classroom= method

      classroom.add_student(student)

      expect(classroom.students).to include(student)
    end

    it 'sets the classroom for the student' do
      expect(student).to receive(:classroom=).with(classroom)

      classroom.add_student(student)
    end
  end
end
