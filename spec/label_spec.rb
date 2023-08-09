require_relative 'spec_helper'

describe Label do
  before :each do
    @label = Label.new('Test Label', 'red')
  end

  context '#add_item' do
    it 'adds an item to the label' do
      item = Item.new(Date.today - 365, archived: false)
      @label.add_item(item)

      expect(@label.items).to include(item)
      expect(item.label).to eq 'Test Label'
    end

    it 'does not add non-Item objects to the label' do
      non_item = 'Not items'
      @label.add_item(non_item)

      expect(@label.items).to be_empty
    end
  end
end
