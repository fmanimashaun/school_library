require './book'
require './person'

# The Rental class represents a book rental.
# It holds the date on which the book was rented and the book and person involved.
class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person

    book.rentals << self
    person.rentals << self
  end
end
