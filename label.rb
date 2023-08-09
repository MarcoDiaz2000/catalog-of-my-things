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

  private

  def generate_id
    rand(100..999)
  end
end
