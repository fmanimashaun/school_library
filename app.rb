require './person'
require './student'
require './teacher'
require './book'
require './rental'
require './classroom'
require './decorator'
require './capitalize_decorator'
require './trimmer_decorator'

class App
  attr_accessor :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def clear
    system('clear')
  end

  def list_books
    clear
    if @books.empty?
      puts "\nNo books available."
    else
      puts "\n"
      @books.each_with_index do |book, index|
        puts "#{index}) Title: '#{book.title}', Author: '#{book.author}'"
      end
    end
  end

  def list_people
    clear
    if @people.empty?
      puts "\nNo people available."
    else
      puts "\n"
      @people.each_with_index do |person, index|
        if person.class == Student
          puts "#{index}) [Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        else
          puts "#{index}) [Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        end
      end
    end
  end

  def create_person
    clear
    print "\nDo you want to create a student (1) or a teacher (2)? [Input the number]: "
    person_type = gets.chomp.to_i

    case person_type
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid option, person not created'
    end
  end

  def create_student
    clear

    print 'Name: '
    name = gets.chomp

    print 'Age: '
    age = gets.chomp.to_i

    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp.strip.upcase

    case permission
    when 'Y'
      student = Student.new(age, name)
      @people << student
      puts "\nPerson created successfully"
    when 'N'
      student = Student.new(age, name, parent_permission: false)
      @people << student
      puts "\nPerson created successfully"
    else
      puts "\nInvalid option. Student not created."
    end
  end

  def create_teacher
    clear

    print 'Name: '
    name = gets.chomp

    print 'Age: '
    age = gets.chomp.to_i

    print "Specialization: "
    specialization = gets.chomp

    teacher = Teacher.new(age, name, specialization)
    @people << teacher

    puts "\nPerson created successfully"
  end

  def create_book
    clear

    print 'Enter the book title: '
    title = gets.chomp

    print 'Enter the book author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books << book

    puts "\nBook created successfully"
  end

  def create_rental
    clear

    return puts "\nNo books available." if @books.empty?
    return puts "\nNo people available." if @people.empty?

      puts "\nSelect a book from the following list by number#{'[0 - ' + (@books.length - 1).to_s + ']' unless @books.length == 1}"
      list_books

      book_index = gets.chomp.to_i
      book = @books[book_index]

      puts "\nSelect a person from the following list by number#{' [0 - ' + (@people.length - 1).to_s + ']' unless @people.length == 1} (not id)"
      list_people

      person_index = gets.chomp.to_i
      person = @people[person_index]

      print 'Enter the rental date (YYYY/MM/DD): '
      date = gets.chomp

      rental = Rental.new(date, book, person)
      @rentals << rental

      puts "\nRental created successfully."
  end

  def rental_list
    clear
    return puts 'No rentals available.' if @rentals.empty?

    list_people


    print 'ID of person: '
    person_id = gets.chomp.to_i

    rentals = @rentals.select { |rental| rental.person.id == person_id }

    if rentals.empty?
      puts "No rentals found for person with ID #{person_id}."
    else
      rentals.each do |rental|
        puts "Person: #{rental.person.name}, Book: #{rental.book.title}, Rental date: #{rental.date}"
      end
    end
  end
end
