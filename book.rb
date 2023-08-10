require_relative 'item'

class Book < Item
  attr_accessor :title, :publisher, :cover_state

  # rubocop:disable Lint/UnusedMethodArgument
  def initialize(title, publisher, cover_state, published_date = nil, archived: false)
    super(published_date)
    @title = title
    @publisher = publisher
    @cover_state = cover_state
  end
  # rubocop:enable Lint/UnusedMethodArgument

  def to_hash
    {
      id: @id,
      title: @title,
      publisher: @publisher,
      cover_state: @cover_state,
      published_date: @published_date
    }
  end

  private

  def can_be_archived?
    return true if super || @cover_state == 'bad'

    false
  end
end
