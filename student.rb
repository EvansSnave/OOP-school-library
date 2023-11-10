require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name = 'Unknown', parent_permision: true)
    super(age, name, parent_permision: parent_permision)
    assign_classroom(classroom) if classroom
  end

  def add_to_classroom=(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end

  def assign_classroom(classroom)
    self.add_to_classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
