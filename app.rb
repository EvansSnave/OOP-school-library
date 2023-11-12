require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'classroom'
require_relative 'teacher'
require_relative 'student'
require_relative 'person'
require_relative 'rental'
require_relative 'book'

class App
  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  def list_all_books2
    @books
  end

  def list_all_persons2
    @persons
  end

  def create_a_teacher2(name, age, specialization)
    @persons.push(Teacher.new(age, specialization, name, parent_permission: true))
  end

  def create_a_student2(name, age, parent_permission)
    @persons.push(Student.new(age, nil, name, parent_permission: parent_permission))
  end

  def create_a_book2(title, author)
    @books.push(Book.new(title, author))
  end

  def create_a_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    create_a_book2(title, author)
    puts 'Book created successfully'
    puts
  end

  def create_a_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parents permission ? [y/n]: '
    permission = gets.chomp
    puts 'Person created successfully '
    puts
    self.create_a_student2(name, age, permission)
  end

  def create_a_rental
    puts 'Select a book from the following list by number'
    list_all_books(with_id: true)
    book = gets.chomp
    puts 'Select a person from the following list by number(not id)'
    list_all_persons(with_id: true)
    person = gets.chomp
    print 'Date: '
    date = gets.chomp
    puts 'Rental created successfully'
    puts
    create_a_rental2(date, book.to_i, person.to_i)
  end

  def list_all_books(with_id: false)
    if with_id
      self.list_all_books2.each.with_index(0) do |book, idx|
        puts "#{idx}) Title: \"#{book.title}\", Author: #{book.author}"
      end
    else
      self.list_all_books2.each do |book|
        puts "Title: \"#{book.title}\", Author: #{book.author}"
      end
    end
    puts
  end

  def list_all_persons(with_id: false)
    if with_id
      self.list_all_persons2.each.with_index(0) do |person, idx|
        puts "#{idx}) [#{person.class}] Name: \"#{person.name}\", ID: #{person.id}, Age: #{person.age}"
      end
    else
      self.list_all_persons2.each do |person|
        puts "[#{person.class}] Name: \"#{person.name}\", ID: #{person.id}, Age: #{person.age}"
      end
    end
    puts
  end

  def create_a_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    puts 'Person created successfully '
    puts
    self.create_a_teacher2(name, specialization, age)
  end

  def create_a_person
    loop do
      print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
      option = gets.chomp

      case option
      when '1'
        create_a_student
        break
      when '2'
        create_a_teacher
        break
      else
        puts 'Option unknown'
      end
    end
  end

  def list_rental_person
    print 'ID of person: '
    id = gets.chomp
    puts 'Rentals: '
    rentals = self.list_rental_person2(id.to_i)
    rentals&.each do |rental|
      puts "Date: \"#{rental.date}\", Book: #{rental.person.title} by #{rental.person.author}"
    end
    puts
  end

  def create_a_rental2(date, book_id, person_id)
    @rentals.push(Rental.new(date, @books[book_id], @persons[person_id]))
  end

  def list_rental_person2(id)
    @persons.each do |person|
      return person.rentals if person.id == id
    end
    nil
  end
end
