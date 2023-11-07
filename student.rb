class Student < Person
  def initialize(age, classroom, name = 'Unknown', parent_permision: true)
    super(age, name, parent_permision: parent_permision)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
