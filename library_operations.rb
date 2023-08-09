require 'json'
require_relative 'music_album_operations'
require_relative 'genre_operations'

class LibraryOperations
  def initialize
    @music_album_operations = MusicAlbumOperations.new
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
    'list.books'
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
    'label.list'
  end

  # option 6
  def list_authors
    'author.list'
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
    'game.add'
  end

  # option 10
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
