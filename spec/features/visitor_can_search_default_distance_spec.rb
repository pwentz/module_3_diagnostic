require 'rails_helper'
#
# As a user
# When I visit "/"
# And I fill in the search form with 80203
# And I click "Locate"
# Then I should be on page "/search" with parameters visible in the url
# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
# And the stations should be limited to Electric and Propane
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times

RSpec.describe 'Visitor can search by zip code', type: :feature do
  scenario 'they search without entering distance' do
    VCR.use_cassette('nrel_service#default_fuel_stations') do
      visit '/'

      fill_in 'q', with: '80203'
      click_button 'Locate'
    end
  end
end
