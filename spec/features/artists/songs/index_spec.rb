#As a user
#When I visit an Artist's Songs Index
#Then I see the titles of all the Artist's Songs
#And I see that each title is a link to the songs show page

require 'rails_helper'

RSpec.describe "artists songs index page" do
  it 'shows all of the songs for the artist' do
    prince = Artist.create!(name: 'Prince')
    purple = prince.songs.create!(title: 'Purple Rain', length: 834, play_count: 8934)
    beret = prince.songs.create!(title: 'Raspberry Beret', length: 934, play_count: 930)

    visit "/artists/#{prince.id}/songs"

    expect(page).to have_content(purple.title)
    expect(page).to have_content(beret.title)
  end

  it "links to each songs show page" do
    prince = Artist.create!(name: 'Prince')
    purple = prince.songs.create!(title: 'Purple Rain', length: 834, play_count: 8934)
    beret = prince.songs.create!(title: 'Raspberry Beret', length: 934, play_count: 930)
    
    visit "/artists/#{prince.id}/songs"
    
    click_on(purple.title) #click on is capybara method
    expect(current_path).to eql("/songs/#{purple.id}") #current path is capybara method
  end

  it "shows the average song length for the artist" do
    prince = Artist.create!(name: 'Prince')
    purple = prince.songs.create!(title: 'Purple Rain', length: 834, play_count: 8934)
    beret = prince.songs.create!(title: 'Raspberry Beret', length: 934, play_count: 930)

    visit "/artists/#{prince.id}/songs"

    expect(page).to have_content("Average Song Length for Prince: 884")

  end


end