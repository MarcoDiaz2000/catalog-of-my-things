require_relative 'music_album_operations'
require_relative 'genre_operations'
require_relative 'book_operations'

class LibraryOperations
  def initialize
    @music_album_operations = MusicAlbumOperations.new
    @book_operations = BookOperations.new
    @genre_operations = GenreOperations.new
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
    10 => :exit_program
  }.freeze
  # option 1
  def list_books
    @book_operations.list_books
  end

  # option 2
  def list_music_albums
    @music_album_operations.list
  end

  # option 3
  def list_games
    'game.list'
  end

  # option 4
  def list_genres
    @genre_operations.list
  end

  # option 5
  def list_labels
    @book_operations.list_labels
  end

  # option 6
  def list_authors
    'author.list'
  end

  # option 7
  def add_book
    @book_operations.add_book
  end

  # option 8
  def add_music_album
    @music_album_operations.add_music_album(@genre_operations)
  end

  # option 9
  def add_game
    'game.add'
  end

  # option 10
  def exit_program
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
