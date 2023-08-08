require_relative 'music_album'

class MusicAlbumOperations
  attr_accessor :albums

  def initialize
    @albums = []
  end

  def list
    if @albums.empty?
      puts 'The list is empty.'
    else
      @albums.each do |album|
        puts "Album ID: #{album.id}, published date: #{album.published_date}, on Spotify: #{album.on_spotify}"
      end
    end
  end

  def create(published_date, on_spotify, genre, archived: false)
    album = MusicAlbum.new(published_date, on_spotify: on_spotify, archived: archived)
    @albums << album
    genre.add_item(album) if genre
    album
  end

  def add_music_album
    puts 'Enter the published date (YYYY-MM-DD):'
    published_date = Date.parse(gets.chomp)
    puts 'Is it on Spotify? (yes/no):'
    on_spotify = gets.chomp.downcase == 'yes'
    album = create(published_date, on_spotify)
    puts "Album id: #{album.id}, published date: #{album.published_date}, and on Spotify: #{album.on_spotify}"
  end
end
