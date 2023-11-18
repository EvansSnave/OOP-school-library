require 'rspec'
require_relative '../lib/student'
require_relative '../lib/classroom'

describe Student do
  let(:student) { Student.new(18, 'David', 234) }
  let(:classroom) { Classroom.new('Math') }

  describe '#initialize' do
    it 'creates a new student with the given attributes' do
      expect(student.name).to eq('David')
      expect(student.age).to eq(18)
      expect(student.id).to eq(234)
      expect(student.can_use_services?).to be true
      expect(student.books).to be_empty
      expect(student.rentals).to be_empty
    end
  end

  describe '#classroom=' do
    it 'assigns a classroom to the student and adds the student to the classroom\'s students' do
      student.classroom = classroom
      expect(student.instance_variable_get(:@classroom)).to eq(classroom)
      expect(classroom.students).to include(student)
    end
  end

  describe '#play_hooky' do
    it 'returns a funny message' do
      expect(student.play_hooky).to eq('¯(ツ)/¯')
    end
  end

  describe '.json_create' do
    it 'creates a new student from a hash of attributes' do
      hash = {
        'name' => 'Emma',
        'id' => 345,
        'age' => 17,
        'parent_permission' => false,
        'books' => [],
        'rentals' => []
      }
      student = Student.json_create(hash)
      expect(student.name).to eq('Emma')
      expect(student.id).to eq(345)
      expect(student.age).to eq(17)
      expect(student.can_use_services?).to be false
      expect(student.books).to be_empty
      expect(student.rentals).to be_empty
    end
  end
end
