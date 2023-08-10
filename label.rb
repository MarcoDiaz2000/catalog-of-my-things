class Label
  attr_reader :id, :title, :color
  attr_accessor :items

  def initialize(title, color)
    @id = generate_id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    return unless item.is_a?(Item)

    item.label = title
    items << item
  end

  def to_hash
    {
      id: @id,
      title: @title,
      color: @color,
      items: @items.map(&:id)
    }
  end

  def self.from_hash(hash)
    new_label = Label.new(hash[:title], hash[:color])
    new_label.id = hash[:id]
    new_label.items = hash[:items] || []
    new_label
  end

  private

  def generate_id
    rand(10..99)
  end
end
