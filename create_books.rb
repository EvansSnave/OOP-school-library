require_relative 'book'

class CreateBooks
  def create_a_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    create_a_book2(title, author)
    puts 'Book created successfully'
    puts
  end

  def create_a_book2(title, author)
    @book = Book.new(title, author)
  end

  def add_book(arr)
    create_a_book
    arr.push(@book)
  end
end

class ShowBooks
  def list_all_books(with_id, arr)
    if with_id
      arr.each.with_index(0) do |book, idx|
        puts "#{idx}) Title: \"#{book.title}\", Author: #{book.author}"
      end
    else
      arr.each do |book|
        puts "Title: \"#{book.title}\", Author: #{book.author}"
      end
    end
    puts
  end
end
