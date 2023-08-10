# book.rb

require_relative 'item'

class Book < Item
  attr_accessor :title, :publisher, :cover_state

  def initialize(title, publisher, cover_state, published_date = nil, archived: false)
    super(published_date, archived: archived)
    @title = title
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    return true if super || @cover_state == 'bad'

    false
  end

  public

  def to_hash
    {
      title: @title,
      publisher: @publisher,
      cover_state: @cover_state
    }.merge(super)
  end

  def self.from_hash(hash)
    new_book = Book.new(hash[:title], hash[:publisher], hash[:cover_state], hash[:published_date], archived: hash[:archived])
    new_book.id = hash[:id]
    new_book.genre = hash[:genre]
    new_book.author = hash[:author]
    new_book.source = hash[:source]
    new_book.label = hash[:label]
    new_book
  end
end
