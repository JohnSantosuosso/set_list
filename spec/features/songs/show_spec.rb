require 'rails_helper'

RSpec.describe 'the songs show page' do
  it 'displays the song title' do
    artist = Artist.create(name: "Zac Brown")
    song = artist.songs.create!(title: "Chicken Fried", length: 28, play_count: 23248 )
    song_2 = artist.songs.create!(title: "Freedom", length: 49, play_count: 248 )
    visit "/songs/#{song.id}"
    # localhost: 3000/songs/1

    expect(page).to have_content(song.title)
    expect(page).to_not have_content(song_2.title)
  end

  #As a visitor, when I visit /songs/1 (where 1 is the id of a song) I see that song's title and artist
  #I do not see any of the other songs in my database

  it 'displays the name of an artist for the song' do
    artist = Artist.create(name: "Zac Brown")
    song = artist.songs.create!(title: "Chicken Fried", length: 28, play_count: 23248 )
    song_2 = artist.songs.create!(title: "Freedom", length: 49, play_count: 248 )
    visit "/songs/#{song.id}"
    # localhost: 3000/songs/1
    save_and_open_page #capybara test/visual confirmation

    expect(page).to have_content(artist.name)

  end


end
