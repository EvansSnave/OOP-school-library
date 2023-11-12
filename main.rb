require_relative 'app'

class Main
  def initialize
    @app = App.new
  end

  def create_a_book
    @app.create_a_book
  end

  def create_a_rental
    @app.create_a_rental
  end

  def list_rental_person
    @app.list_rental_person
  end

  def create_person
    @app.create_a_person
  end

  def list_all_books
    @app.list_all_books
  end

  def list_all_persons
    @app.list_all_persons
  end

  def menu
    puts 'Please choose an option by entering a number: '
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def main
    puts 'Welcome to school library App!'
    puts

    options = %i[list_all_books list_all_persons create_person create_a_book create_a_rental list_rental_person]

    loop do
      menu
      option = gets.chomp
      break if option == '7'

      if option.to_i.positive? && option.to_i < 7
        send(options[option.to_i - 1])
      else
        puts 'Option unknown'
      end
    end
    puts 'Thank you for using this app!'
  end
end

Main.new.main
