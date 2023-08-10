require 'json'
require_relative 'book'
require_relative 'label'

class BookOperations
  attr_accessor :books, :labels

  def initialize
    @books = []
    @labels = []
  end

  def add_book
    print 'Enter title: '
    title = gets.chomp
    print 'Enter publisher: '
    publisher = gets.chomp
    print 'Enter cover state: '
    cover_state = gets.chomp
    print 'Enter published year: '
    published_year = gets.chomp.to_i
    new_book = Book.new(title, publisher, cover_state, Date.new(published_year))

    data = read_file('./Data/books.json')
    @books = data
    @books << new_book

    save_file('./Data/books.json', books)
    puts 'Book successfully added:'
  end

  def add_label
    print 'Enter title: '
    title = gets.chomp
    print 'Enter Color: '
    color = gets.chomp
    new_label = Label.new(title, color)

    data = read_file('./Data/labels.json')
    @labels = data
    @labels << new_label

    save_file('./Data/labels.json', labels)
    puts 'Label successfully added:'
  end

  def list_books
    data = read_file('./Data/books.json')
    if data.empty?
      puts 'No books have been added.'
    else
      puts 'List of all books:'
      data.each do |book|
        puts "Title: #{book[:title]}, Published Date: #{book[:published_date]}, " \
             "Publisher: #{book[:publisher]}, Cover State: #{book[:cover_state]}"
      end
    end
  end

  def list_labels
    data = read_file('./Data/labels.json')
    if data.empty?
      puts 'No labels have been added.'
    else
      puts 'List of all labels:'
      data.each do |label|
        puts "Label ID: #{label[:id]}, Title: #{label[:title]}, Color: #{label[:color]}"
      end
    end
  end

  def save_file(file, content)
    data = content.map(&:to_hash)
    json = JSON.pretty_generate(data)
    File.write(file, json)
  end

  def read_file(file_name)
    if File.exist?(file_name)
      file = File.read(file_name)
      JSON.parse(file, symbolize_names: true)
    else
      []
    end
  end
end
