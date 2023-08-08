require_relative 'genre'

class GenreOperations
  attr_accessor :genres


  def initialize
    @genres = [Genre.new('Rock'), Genre.new('Pop'), Genre.new('Jazz'), Genre.new('Classical')]
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
end
