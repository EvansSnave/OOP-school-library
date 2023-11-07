class Teacher < Person
  def initialize(specializacion, age, name = 'Unknown', parent_permision: true,)
    super(age, name, parent_permision: parent_permision)
    @specialization = specializacion
  end

  def can_use_service?
    true
  end
end
