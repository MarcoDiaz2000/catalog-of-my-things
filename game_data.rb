# game_data.rb

require 'json'

class GameData
  def self.path
    File.expand_path('./Data/games.json', __dir__) # Use absolute path
  end

  def self.save_data(games)
    games_data = games.map do |game|
      {
        id: game.id,
        title: game.title,
        multiplayer: game.multiplayer,
        last_played_at: game.last_played_at
      }
    end
    File.write(GameData.path, JSON.generate(games_data))
    puts 'Games saved successfully.'
  rescue Errno::ENOENT => e
    puts "Error: #{e.message}"
  end

  def self.read_data
    return [] unless File.exist?(GameData.path)

    JSON.parse(File.read(GameData.path)).map do |obj|
      Game.new(obj['title'], obj['multiplayer'], obj['last_played_at'], obj['id'])
    end
  end
end
