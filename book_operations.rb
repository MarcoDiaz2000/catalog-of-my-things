require_relative 'book'
require_relative 'label'

class BookOperations 
    attr_accessor :books, :labels
    
    def initialize
        @books = []
        @labels = [
            Label.new("Gift", "blue"),
            Label.new("New", "green"),
            Label.new("Classic", "red"),
            Label.new("Bestseller", "orange"),
            Label.new("Sci-Fi", "purple")
        ]
    end

    def add_book 
        print "Enter title: "
        title = gets.chomp
        print "Enter publisher: "
        publisher = gets.chomp
        print "Enter cover state: "
        cover_state = gets.chomp
        print "Enter published year: "
        published_year = gets.chomp.to_i
        print "Is the book archived? (y/n): "
        archived_input = gets.chomp.downcase
        archived = archived_input == 'y' || archived_input == 'yes'
        new_book = Book.new(title, publisher, cover_state, Date.new(published_year), archived: archived)
        books << new_book

        puts "Book successfully added:"
        puts "Title: #{new_book.title}, Published Date: #{new_book.published_date}, Publisher: #{new_book.publisher}, Cover State: #{new_book.cover_state}"
    end

    def list_books
        if books.empty?
            puts "No books have been added."
        else
            puts "List of all books:"
            books.each do |book|
                puts "Title: #{book.title}, Published Date: #{book.published_date}, Publisher: #{book.publisher}, Cover State: #{book.cover_state}"
            end
        end
    end

    def list_labels
        if labels.empty?
            puts "No labels have been added."
        else
            puts "List of all labels:"
            labels.each do |label|
                puts "Label ID: #{label.id}, Title: #{label.title}, Color: #{label.color}"
            end
        end
    end
end
