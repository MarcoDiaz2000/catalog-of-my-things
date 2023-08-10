require_relative 'spec_helper'

describe Book do
  before :each do
    @book = Book.new('Afghanistan', 'Ofouq', 'good', Time.now - (11 * 365 * 24 * 60 * 60), archived: true)
  end

  context ', Check an object:' do
    it 'Is the @book an intstance of Book class?' do
      expect(@book).to be_an_instance_of Book
    end

    it 'Is the values passed correctly?' do
      expect(@book.title).to eq 'Afghanistan'
      expect(@book.publisher).to eq 'Ofouq'
      expect(@book.cover_state).to eq 'good'
    end
    

    it 'Is the object archivable?' do
      archivable = @book.move_to_archive
      expect(archivable).to be true
    end
  end
end
