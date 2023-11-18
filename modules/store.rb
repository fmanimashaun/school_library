require 'json'
require 'fileutils'

module Store
  def save_people
    # Ensure the 'data' directory exists
    FileUtils.mkdir_p('data')

    File.write('data/people.json', JSON.dump(@people.map(&:to_hash)))
  end

  def load_people
    return unless File.exist?('data/people.json')

    JSON.parse(File.read('data/people.json'), create_additions: true).map do |person|
      @people << person
    end
    puts @people
  end

  def save_books
    # Ensure the 'data' directory exists
    FileUtils.mkdir_p('data')

    File.write('data/books.json', JSON.dump(@books.map(&:to_hash)))
  end

  def load_books
    return unless File.exist?('data/books.json')

    JSON.parse(File.read('data/books.json'), create_additions: true).map do |book|
      @books << book
    end
  end

  def save_rentals
    # Ensure the 'data' directory exists
    FileUtils.mkdir_p('data')

    File.write('data/rentals.json', JSON.dump(@rentals.map(&:to_hash)))
  end

  def load_rentals
    return unless File.exist?('data/rentals.json')

    JSON.parse(File.read('data/rentals.json')).map do |rental|
      person = @people.find { |person_object| person_object.person_id == rental['person'] }
      book = @books.find { |book_object| book_object.id == rental['book'] }
      @rentals << Rental.new(rental['date'], book, person)
    end
  end
end
