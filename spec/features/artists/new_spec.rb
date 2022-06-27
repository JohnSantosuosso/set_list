#As a visitor
#When I visit the artists index
#And click on New Artist
#Then my current path is '/artists/new'
#And I fill in the artists name
#Then I click Create Artist
#I am redirected to this new artists show page

require 'rails_helper'

RSpec.describe 'the Artist creation' do
  it 'links to the new page from the artist index' do
    visit '/artists'

    click_link('New Artist')
    expect(current_path).to eq('/artists/new')
  end

end
