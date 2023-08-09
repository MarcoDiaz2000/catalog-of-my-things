class Genre
  attr_accessor :name, :items, :id

  def initialize(name)
    @name = name
    @items = []
    @id = generate_id
  end

  def add_item(item)
    @items << item
    item.genre = self
  end

  private

  def generate_id
    rand(1..1000)
  end

  def add_item(item)
    @items << item
    item.genre = self
  end

  def generate_id
    rand(1..1000)
  end
end
