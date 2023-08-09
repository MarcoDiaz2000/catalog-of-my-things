require_relative 'list_data'
require_relative 'add_game'
require_relative 'list_games'
require_relative 'data_author'

class App
  attr_reader :authors, :games

  def initialize
    @authors = AuthorData.read_data
    @games = GameData.read_data
  end

  def app_save
    AuthorData.save_data(@authors)
    GameData.save_data(@games)
  end
end
