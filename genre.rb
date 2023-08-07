class Genre
  attr_accessor :name, :items
  attr_reader :id

  def initialize(name)
    @id = generate_id
    @name = name
    @items = []
  end
end
