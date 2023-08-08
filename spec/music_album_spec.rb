require 'rspec'
require_relative '../item'
require_relative '../music_album'

describe MusicAlbum do
  before(:each) do
    @music_album = MusicAlbum.new(Time.now - (11 * 365 * 24 * 60 * 60), on_spotify: true)
  end

  describe '#initialize' do
    it 'initializes with on_spotify attribute' do
      expect(@music_album.on_spotify).to be true
    end
  end

  describe '#can_be_archived?' do
    it 'returns true if parent method is true and on_spotify is true' do
      expect(@music_album.can_be_archived?).to be true
    end

    it 'returns false if on_spotify is false' do
      @music_album.on_spotify = false
      expect(@music_album.can_be_archived?).to be false
    end

    it 'returns false if published_date is less than 10 years ago' do
      @music_album.published_date = Time.now - (9 * 365 * 24 * 60 * 60)
      expect(@music_album.can_be_archived?).to be false
    end
  end
end
