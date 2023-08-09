require_relative 'item'
require 'date'

class Game < Item
  attr_accessor :title, :multiplayer, :last_played_at

  def initialize(title, multiplayer, last_played_at, publish_date)
    @title = title
    super(publish_date) # Call the superclass constructor with the published_date argument
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end

  private

  def can_be_archived?
    Time.new.year - @last_played_at.year > 2 && super
  end
end
