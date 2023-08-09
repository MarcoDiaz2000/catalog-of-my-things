require 'json'
require_relative 'item'
require_relative 'music_album'

class MusicAlbumOperations
  attr_accessor :albums

  def initialize
    @albums = []
    load_json
  end

  def list
    if @albums.empty?
      puts 'The list is empty.'
    else
      @albums.each do |album|
        album_details = "Album id: #{album.id}, genre: #{album.genre.name}, published date: #{album.published_date},"
        album_details2 = "on Spotify: #{album.on_spotify}  archived: #{album.archived}"
        puts "#{album_details} #{album_details2}"
      end
    end
  end

  def create(published_date, on_spotify, genre, archived: false)
    album = MusicAlbum.new(published_date, on_spotify: on_spotify, archived: archived)
    album.move_to_archive
    @albums << album
    genre&.add_item(album)
    album
  end

  def save_json
    albums_json = @albums.map do |album|
      {
        id: album.id,
        genre: album.genre.name,
        published_date: album.published_date.to_s,
        on_spotify: album.on_spotify,
        archived: album.archived
      }
    end

    File.open('music_album.json', 'w') do |f|
      f.write(JSON.pretty_generate(albums_json))
    end

    puts 'Albums saved successfully.'
  end

  def load_json
    return unless File.exist?('music_album.json')

    file_content = File.read('music_album.json')
    albums_json = JSON.parse(file_content)
    albums_json.each do |album_json|
      genre_obj = Genre.new(album_json['genre'])
      album = MusicAlbum.new(
        Date.parse(album_json['published_date']),
        on_spotify: album_json['on_spotify'],
        archived: album_json['archived']
      )
      album.id = album_json['id']
      album.genre = genre_obj
      @albums << album
    end

    puts 'Albums loaded successfully.'
  end

  def add_music_album(genre_operations)
    published_date = ask_for_published_date
    on_spotify = ask_if_on_spotify
    genre = choose_genre(genre_operations)
    album = create(published_date, on_spotify, genre)
    print_album_details(album, genre)
  end

  def ask_for_published_date
    date = nil
    until date
      puts 'Enter the published date (YYYY-MM-DD):'
      input = gets.chomp
      begin
        date = Date.parse(input)
      rescue ArgumentError
        puts 'Invalid date format. Please enter the date in the format YYYY-MM-DD.'
      end
    end
    date
  end

  def ask_if_on_spotify
    on_spotify = nil
    until %w[yes no].include?(on_spotify)
      puts 'Is it on Spotify? (yes/no):'
      on_spotify = gets.chomp.downcase
      puts 'Invalid option. Please enter "yes" or "no".' unless %w[yes no].include?(on_spotify)
    end
    on_spotify == 'yes'
  end

  def choose_genre(genre_operations)
    genre = nil
    until genre
      puts 'Choose a genre from the list by entering the corresponding id:'
      genre_operations.list
      genre_choice = gets.chomp.to_i
      genre = genre_operations.genres.find { |g| g.id == genre_choice }
      puts 'Invalid genre selection. Please choose a valid option.' if genre.nil?
    end
    genre
  end

  def print_album_details(album, genre)
    album_details = "Album id: #{album.id}, genre: #{genre.name}, published date: #{album.published_date},"
    album_details2 = "on Spotify: #{album.on_spotify}  archived: #{album.archived}"
    puts "#{album_details} #{album_details2}"
  end
end
