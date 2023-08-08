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
  
      @items << item
      item.label = self
    end
  
    private
  
    def generate_id
      rand(1000..9999)
    end
  end
  