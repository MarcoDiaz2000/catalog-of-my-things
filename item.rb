require 'date'

class Item
  attr_reader :archived
  attr_accessor :id, :published_date, :genre, :author, :source, :label

  def initialize(published_date = nil, archived: false)
    @id = generate_id
    @genre = genre
    @author = author
    @source = source
    @label = label
    @published_date = published_date
    @archived = archived
  end

  def can_be_archived?
    return false unless published_date && published_date < (Time.now - (10 * 365 * 24 * 60 * 60))

    true
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end

  private

  def generate_id
    rand(10..300)
  end

  public

  def to_hash
    {
      id: @id,
      genre: @genre,
      author: @author,
      source: @source,
      label: @label,
      published_date: @published_date,
      archived: @archived
    }
  end
end
