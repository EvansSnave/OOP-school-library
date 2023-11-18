module PeopleMod
  def take_type
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    choice = gets.chomp.to_i
    if [1, 2].include?(choice)
      choice
    else
      puts 'You should choise 1 or 2'
      take_type
    end
  end

  def take_age
    print 'Age: '
    age = Integer(gets.chomp)
    if age <= 0
      puts 'Age should be positive.'
      take_age
    else
      age
    end
  end

  def take_name
    print 'Name: '
    name = gets.chomp.strip
    if name.empty?
      puts 'Name cannot be empty'
      take_name
    else
      name
    end
  end

  def take_parent_permission
    print 'Has parent permission? [Y/N]: '
    parent_permission_input = gets.chomp.downcase
    if %w[y n].include?(parent_permission_input)
      parent_permission_input
    else
      puts 'Invalid input. Choose Y or N.'
      take_parent_permission
    end
  end

  def take_specialization
    print 'Specialization: '
    specialization = gets.chomp.strip
    if specialization.empty?
      puts 'Specialization cannot be empty.'
      take_specialization
    else
      specialization
    end
  end
end
