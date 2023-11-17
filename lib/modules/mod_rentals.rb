module RentalsMod
  def select_book
    puts 'Select a book from the following list by number:'
    @books.each_with_index { |book, index| puts "#{index + 1}) Title: #{book.title}, Author: #{book.author}" }
    book_index = gets.chomp.to_i - 1
    if book_index >= 1
      puts 'invalide key'
      select_book
    else
      @books[book_index]
    end
  end

  def select_person
    puts 'Select a person from the following list by number:'
    @people.each_with_index { |person, index| puts "#{index + 1}) ID: #{person.id}, Name: #{person.name}" }
    person_index = gets.chomp.to_i - 1
    if person_index >= 1
      puts 'invalide key'
      select_person
    else
      @people[person_index]
    end
  end

  def take_date
    print 'Date: '
    gets.chomp
  end
end
