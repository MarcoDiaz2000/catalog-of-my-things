require_relative 'item'
require 'date'
class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
    super(publish_date)
  end

  private

  def can_be_archived?
    Time.new.year - @last_played_at > 2 && super
  end
end
