module BooksMod
  def take_title
    print 'Title: '
    title = gets.chomp
    if title.empty?
      puts 'Title cannot be empty.'
      take_title
    else
      title
    end
  end

  def take_author
    print 'Author: '
    author = gets.chomp
    if author.empty?
      puts 'Title cannot be empty.'
      take_author
    else
      author
    end
  end
end
