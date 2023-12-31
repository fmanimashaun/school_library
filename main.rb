require './app'
require './menu'

class Main
  def start
    app = App.new
    app.load_people
    app.load_books
    app.load_rentals
    option = 1

    while option != 7
      Menu.display
      option = user_input
      handle_option(app, option)
    end

    puts "\nThanks for using the School Library App!"

    app.save_people
    app.save_books
    app.save_rentals

    Menu.clear_screen
  end

  def user_input
    gets.chomp.to_i
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
end

Main.new.start
