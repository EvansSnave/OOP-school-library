require_relative 'person'
require 'json'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age, specialization, name = 'Unknown', id = nil)
    super(age, name, id)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def self.json_create(hash)
    name = hash.fetch('name', 'Unknown')
    id = hash.fetch('id', 0)
    age = hash.fetch('age', 0)
    specialization = hash.fetch('specialization', 'None')
    teacher = new(age, specialization, name, id)
    books = hash.fetch('books')
    rentals = hash.fetch('rentals')
    teacher.books = books
    teacher.rentals = rentals
    teacher
  end
end
