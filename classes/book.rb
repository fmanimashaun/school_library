require_relative 'rental'
require 'json'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
  end

  def to_json
    {
      'json_class' => self.class.name,
      'title' => @title,
      'author' => @author
  }.to_json
  end

  def self.json_create(object)
    new(object['title'], object['author'])
  end
end
