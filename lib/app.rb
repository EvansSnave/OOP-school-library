require_relative 'book'
require_relative 'person'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'
require_relative 'modules/mod_people'
require_relative 'modules/mod_books'
require_relative 'modules/mod_rentals'

class App
  include PeopleMod
  include BooksMod
  include RentalsMod
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_all_books
    if @books.empty?
      puts 'No books available.'
    else
      @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
  end

  def list_all_people
    if @people.empty?
      puts 'No people added.'
    else
      @people.each { |person| puts "ID: #{person.id}, Name: #{person.name}" }
    end
  end

  def create_person
    type = take_type
    age = take_age
    name = take_name
    if type == 1
      parent_permission = take_parent_permission
      create_student(age, name, parent_permission)
    else
      specialization = take_specialization
      create_teacher(age, specialization, name)
    end
  end

  def create_student(age, name, parent_permission)
    student = Student.new(age, name, parent_permission: parent_permission)
    @people << student
    puts 'Student created successfully!'
  end

  def create_teacher(age, specialization, name)
    teacher = Teacher.new(age, specialization, name)
    @people << teacher
    puts 'Teacher created successfully!'
  end

  def create_book
    title = take_title
    author = take_author
    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully!'
  end

  def create_rental
    book = select_book
    person = select_person
    date = take_date

    rental = Rental.new(date, person, book)
    @rentals << rental
    puts 'Rental created successfully!'
  end

  def list_rentals_for_person(person_id)
    rentals = @rentals.select { |rental| rental.person.id == person_id }

    if rentals.empty?
      puts "No rentals found for person with ID #{person_id}."
    else
      rentals.each { |rental| puts "Date: #{rental.date}, Book: #{rental.book.title}" }
    end
  end
end
