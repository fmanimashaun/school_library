require 'json'
require 'fileutils'

module Store
  def save_people
    # Ensure the 'data' directory exists
    FileUtils.mkdir_p('data')

    File.write('data/people.json', JSON.dump(@people.map(&:to_json)))
  end

  def load_people
    return unless File.exist?('data/people.json')

    JSON.parse(File.read('data/people.json')).map do |person|
      person_obj = JSON.parse(person, create_additions: true)
      @people << person_obj
    end
  end

  def save_books
    # Ensure the 'data' directory exists
    FileUtils.mkdir_p('data')

    File.write('data/books.json', JSON.dump(@books.map(&:to_json)))
  end

  def load_books
    return unless File.exist?('data/books.json')

    JSON.parse(File.read('data/books.json')).map do |book|
     book_obj = JSON.parse(book, create_additions: true)
      @books << book_obj
    end
  end

  def save_rentals
    # Ensure the 'data' directory exists
    FileUtils.mkdir_p('data')

    File.write('data/rentals.json', JSON.dump(@rentals.map(&:to_json)))
  end

  def load_rentals
    return unless File.exist?('data/rentals.json')

    JSON.parse(File.read('data/rentals.json')).map do |rental|
      rental_obj = JSON.parse(rental)
      book = @books.find { |b| b.id == rental_obj['book'] }
      person = @people.find { |p| p.id == rental_obj['person'] }
      @rentals << Rental.new(rental_obj['date'], book, person)
    end
  end
end
