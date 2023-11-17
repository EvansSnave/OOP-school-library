require_relative 'app'

def main
  app = App.new

  loop do
    puts '\nPlease choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person (student or teacher)'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person ID'
    puts '7 - Exit'

    choice = gets.chomp

    case choice
    when '1'
      app.list_all_books
    when '2'
      app.list_all_people
    when '3'
      app.create_person
    when '4'
      app.create_book
    when '5'
      app.create_rental
    when '6'
      print 'Enter the person ID: '
      person_id = gets.chomp.to_i
      app.list_rentals_for_person(person_id)
    when '7'
      exit('Goodbye!')
    else
      puts 'Invalid option. Please, try again.'
    end

    # Add an empty line before the end of the loop
  end
end

# Add an empty line before calling the main method
main
