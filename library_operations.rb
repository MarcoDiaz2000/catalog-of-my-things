require 'json'
require_relative 'music_album_operations'
require_relative 'genre_operations'
require_relative 'add_game'
require_relative 'author' # Make sure to include the Author class definition here
require_relative 'list_games'
require_relative 'list_authors'
require_relative 'list_data'
require_relative 'author_data'
require_relative 'game_data'
require_relative 'add_item'

class LibraryOperations
  attr_reader :authors, :games

  def initialize
    @music_album_operations = MusicAlbumOperations.new
    @genre_operations = GenreOperations.new
    @authors = [] # Initialize an array to store authors
    @games = [] # Initialize an array to store games
    @authors = []
    @games = []
    @authors = AuthorData.read_data
    @games = GameData.read_data
  end

  ACTIONS = {
    1 => :list_books,
    2 => :list_music_albums,
    3 => :list_games,
    4 => :list_genres,
    5 => :list_labels,
    6 => :list_authors,
    7 => :add_book,
    8 => :add_music_album,
    9 => :add_game,
    10 => :add_author,
    11 => :exit_program
  }.freeze
  # option 1
  def list_books
    'list.books'
  end

  # option 2
  def list_music_albums
    @music_album_operations.list
  end

  # option 3
  def list_games
    ListGames.new.list_items(@games)
  end

  # option 4
  def list_genres
    @genre_operations.list
  end

  # option 5
  def list_labels
    'label.list'
  end

  # option 6
  def list_authors
    ListAuthors.new.list_authors(@authors)
  end

  # option 7
  def add_book
    'book.add'
  end

  # option 8
  def add_music_album
    @music_album_operations.add_music_album(@genre_operations)
  end

  # option 9
  def add_game
    print 'Enter game name: '
    game_name = gets.chomp

    print 'Is it a multiplayer game? [Y/N] '
    multiplayer = answer_yes?

    print 'When was the last time it was played? (YYYY-MM-DD) '
    last_played_at = gets.chomp

    game = Game.new(game_name, multiplayer, last_played_at, last_played_at) # Updated date fields
    @games << game
    GameData.save_data(games)

    puts 'Game added successfully!'
  end

  def answer_yes?
    answer = gets.chomp
    until %w[y yes n no true false].include?(answer.downcase)
      print 'Wrong option, please enter [Y/N] '
      answer = gets.chomp
    end
    %w[y yes true].include?(answer.downcase)
  end

  # option 10
  def add_author
    print 'Enter author first name: '
    first_name = gets.chomp
    print 'Enter author last name: '
    last_name = gets.chomp

    author = Author.new(first_name, last_name)
    @authors << author
    AuthorData.save_data(authors)

    puts 'Author added successfully!'
  end

  # option 11
  def exit_program
    @music_album_operations.save_json
    @genre_operations.save_json
    puts 'Goodbye!'
    exit
  end

  def execute_option(option)
    if ACTIONS.key?(option)
      send(ACTIONS[option])
    else
      puts 'Invalid selection. Please choose a valid option.'
    end
  end
end
