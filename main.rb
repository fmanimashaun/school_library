# frozen_string_literal: true

require './app'

def clear_screen
  system('clear')
end

def menu
  clear_screen
  puts "\nWelcome to School Library Home Page!"
  puts 'Please enter a number: '
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
  option = gets.chomp.to_i
  (option < 1) || (option > 7) ? invalid_option : option
end

def handle_option(app, option)
  case option
  when 1
    app.list_books
  when 2
    app.list_people
  when 3
    app.create_person
  when 4
    app.create_book
  when 5
    app.create_rental
  when 6
    app.rental_list
  end
end

def invalid_option
  puts 'Invalid option. Please try again.'
  menu
end

def main
  app = App.new
  option = 1
  while option != 7
    option = menu
    handle_option(app, option)
  end

  puts 'Thanks for using the School Library App!'
  clear_screen
end

main
