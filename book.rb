# book.rb

require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, published_date = nil, archived: false)
    super(published_date, archived: archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    return false unless super

    # Add additional conditions specific to Book class for archiving

    true
  end
end
