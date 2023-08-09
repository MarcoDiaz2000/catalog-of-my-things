require 'rspec'
require_relative '../genre'
require_relative '../item'

describe Genre do
  before(:each) do
    @genre = Genre.new('Rock')
    @item = Item.new
  end

  describe '#initialize' do
    it 'initializes with correct name' do
      expect(@genre.name).to eq('Rock')
    end
  end

  describe '#add_item' do
    it 'adds an item to the items array' do
      @genre.add_item(@item)
      expect(@genre.items).to include(@item)
    end

    it 'sets the genre property on the item' do
      @genre.add_item(@item)
      expect(@item.genre).to eq(@genre)
    end
  end

  describe '#generate_id' do
    it 'generates an ID between 1 and 1000' do
      expect(@genre.id).to be_between(1, 1000)
    end
  end
end

