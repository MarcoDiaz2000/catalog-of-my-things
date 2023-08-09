require 'rspec'
require_relative '../item'
require_relative '../music_album'

describe MusicAlbum do
  describe '#can_be_archived?' do
    it 'returns true if published_date is more than 10 years ago and on_spotify is true' do
      music_album = MusicAlbum.new(Date.today.prev_year(11), on_spotify: true)
      expect(music_album.can_be_archived?).to be true
    end

    it 'returns false if on_spotify is false' do
      music_album = MusicAlbum.new(Date.today.prev_year(11), on_spotify: false)
      expect(music_album.can_be_archived?).to be false
    end

    it 'returns false if published_date is less than 10 years ago' do
      music_album = MusicAlbum.new(Date.today.prev_year(9), on_spotify: true)
      expect(music_album.can_be_archived?).to be false
    end
  end
end

