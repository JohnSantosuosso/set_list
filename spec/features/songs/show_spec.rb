require 'rails_helper'

RSpec.describe 'the songs show page' do
  it 'displays the song title' do
    song = Song.create(title: "Chicken Fried", length: 28, play_count: 23248 )
    visit "/songs/#{song.id}"
    # localhost: 3000/songs/1
  end

  it 'displays the name of an artist for the song'
end
