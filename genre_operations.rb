require_relative 'genre'

class GenreOperations
  attr_accessor :genres

  def initialize
    @genres = []
    load_json
  end

  def list
    if @genres.empty?
      puts 'The list is empty'
    else
      @genres.each do |genre|
        puts "Genre id: #{genre.id}, Name: #{genre.name}"
      end
    end
  end

  def save_json
    genres_json = @genres.map do |genre|
      {
        id: genre.id,
        name: genre.name
      }
    end

    File.write('genres.json', JSON.pretty_generate(genres_json))

    puts 'Genres saved successfully.'
  end

  def load_json
    return unless File.exist?('genres.json')

    file_content = File.read('genres.json')
    genres_json = JSON.parse(file_content)
    genres_json.each do |genre_json|
      genre = Genre.new(genre_json['name'])
      genre.instance_variable_set('@id', genre_json['id'])
      @genres << genre
    end

    puts 'Genres loaded successfully.'
  end

  def choose_genre
    genre = nil
    until genre
      puts 'Choose a genre from the list by entering the corresponding id:'
      puts '0 - Create a new genre'
      list
      genre_choice = gets.chomp.to_i
      if genre_choice.zero?
        genre = create_new_genre
      else
        genre = @genres.find { |g| g.id == genre_choice }
        puts 'Invalid genre selection. Please choose a valid option.' if genre.nil?
      end
    end
    genre
  end

  def create_new_genre
    puts 'Enter the name of the new genre:'
    name = gets.chomp
    genre = Genre.new(name)
    @genres << genre
    puts "Genre '#{name}' added successfully."
    genre
  end
end
