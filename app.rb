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
  NAME_PROMPT = 'Name: '.freeze
  AGE_PROMPT = 'Age: '.freeze
  PERMISSION_PROMPT = 'Has parent permission? [Y/N]: '.freeze
  SPECIALIZATION_PROMPT = 'Specialization: '.freeze
  BOOK_TITLE_PROMPT = 'Enter the book title: '.freeze
  BOOK_AUTHOR_PROMPT = 'Enter the book author: '.freeze
  RENTAL_DATE_PROMPT = 'Enter the rental date (YYYY/MM/DD): '.freeze
  PEOPLE_TYPE_PROMPT = 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '.freeze
  PERSON_ID_PROMPT = 'ID of person: '.freeze

  attr_accessor :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_books
    if @books.empty?
      puts "\nNo books available."
    else
      puts "\n=== All Books ==="
      @books.each_with_index do |book, index|
        puts "#{index}) Title: '#{book.title}', Author: '#{book.author}'"
      end
    end
  end

  def list_people
    if @people.empty?
      puts "\nNo people available."
    else
      puts "\n=== All People ==="
      @people.each_with_index do |person, index|
        if person.instance_of?(Student)
          puts "#{index}) [Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        else
          puts "#{index}) [Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        end
      end
    end
  end

  def create_person
    person_type = get_user_input(PEOPLE_TYPE_PROMPT).to_i

    person =
      if person_type == 1
        create_student
      elsif person_type == 2
        create_teacher
      else
        puts "\nInvalid option, person not created"
        return
      end

    @people << person

    puts "\nPerson created successfully"
  end

  def create_student
    name = get_user_input(NAME_PROMPT)

    age = get_user_input(AGE_PROMPT).to_i

    permission = get_user_input(PERMISSION_PROMPT).strip.upcase

    if permission == 'Y'
      Student.new(age, name)
    else
      Student.new(age, name, parent_permission: false)
    end
  end

  def create_teacher
    name = get_user_input(NAME_PROMPT)

    age = get_user_input(AGE_PROMPT).to_i

    specialization = get_user_input(SPECIALIZATION_PROMPT)

    Teacher.new(age, name, specialization)
  end

  def create_book
    title = get_user_input(BOOK_TITLE_PROMPT)

    author = get_user_input(BOOK_AUTHOR_PROMPT)

    book = Book.new(title, author)
    @books << book

    puts "\nBook created successfully"
  end

  def create_rental
    return puts "\nNo books available." if @books.empty?
    return puts "\nNo people available." if @people.empty?

    puts "\nSelect a book from the following list by number#{"[0 - #{@books.length - 1}]" unless @books.length == 1}"

    list_books

    book = gets.chomp.to_i

    puts "\nSelect a person from the following list by number#{unless @people.length == 1
                                                                 " [0 - #{@people.length - 1}]"
                                                               end} (not id)"
    list_people

    person = gets.chomp.to_i

    date = get_user_input(RENTAL_DATE_PROMPT)
    rental = Rental.new(date, book, person)
    @rentals << rental

    puts "\nRental created successfully."
  end

  def rental_list
    return puts "\nNo rentals available." if @rentals.empty?

    list_people

    person_id = get_user_input(PERSON_ID_PROMPT).to_i

    rent_list = @rentals.select { |rental| rental.person.id == person_id }

    if rent_list.empty?
      puts "\nNo rentals found for person with ID #{person_id}."
    else
      puts "\n=== Rentals for Person ID #{person_id} ==="
      rent_list.each do |rental|
        puts "Person: #{rental.person.name}, Book: #{rental.book.title}, Rental date: #{rental.date}"
      end
    end
  end

  private

  def get_user_input(prompt)
    print prompt
    gets.chomp
  end
end
