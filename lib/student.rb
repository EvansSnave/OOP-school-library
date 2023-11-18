require_relative 'person'
require_relative 'classroom'

class Student < Person
  def initialize(age, name = 'Unknown', id = nil, parent_permission: true)
    super(age, name, id, parent_permission: parent_permission)
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def self.json_create(hash)
    name = hash.fetch('name', 'Unknown')
    id = hash.fetch('id', 0)
    age = hash.fetch('age', 0)
    parent_permission = hash.fetch('parent_permission', true)
    books = hash.fetch('books')
    rentals = hash.fetch('rentals')
    student = new(age, name, id, parent_permission: parent_permission)
    student.books = books
    student.rentals = rentals
    student
  end
end
