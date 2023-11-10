require_relative 'person'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'rental'
require_relative 'classroom'
require_relative 'student'
require_relative 'book'

person = Person.new(22, 'maximilianus')
puts person.correct_name

capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name

capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name

classroom = Classroom.new('Science')
first_student = Student.new(12, classroom, 'name1')
puts "Classroom => #{classroom.label} ----- Student name: #{first_student.name} Age: #{first_student.age}"

person1 = Person.new(13, 'name2')
book = Book.new('Book title', 'Book author')
rental = Rental.new('2023-10-11', person1, book)

puts "Rental date: #{rental.date}, person: #{rental.person.name}, book: #{rental.book.title}"

puts "Rentals #{person1.rentals.map { |rentals| rentals.book.title}}"
puts "Books rentals #{person1.rentals.map { |rentals| rentals.person.name}}"
