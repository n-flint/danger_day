require 'rails_helper'

RSpec.describe 'as a user' do
  context 'on the root path' do
    it 'can search most dangerous day' do
      # As a guest user
      # When I visit "/"
      visit root_path
      # And I enter "2018-01-01" into the start date
      fill_in :start_date, with: '2018-01-01'
      # And I enter "2018-01-07" into the end date
      fill_in :end_date, with: '2018-01-07'
      # And I click "Determine Most Dangerous Day"
      click_button 'Determine Most Dangerous Day'
      # Then I should be on "/most_dangerous_day"
      expect(current_path).to eq('/most_dangerous_day')
      # And I should see a heading for "Most Dangerous Day"
      expect(page).to have_content('Most Dangerous Day')
      # And I should see "January 1, 2018 - January 7, 2018"
      expect(page).to have_content('January 1, 2018 - January 7, 2018')
      # And I should see a heading for the most dangerous day in that range "January 1, 2018"
      within '.most_dangerous' do
        expect(page).to have_content('January 1, 2018')
        # And I should see 3 asteroids in that list
        expect(page).to have_css('.asteroid', count: 3)
        # And I should see "Name: (2014 KT76)"
        # And I should see "NEO Reference ID: 3672906"
        expect(page).to have_content('Name: (2014 KT76)')
        expect(page).to have_content('NEO Reference ID: 3672906')
        # And I should see "Name: (2001 LD)"
        # And I should see "NEO Reference ID: 3078262"
        expect(page).to have_content('Name: (2001 LD)')
        expect(page).to have_content('NEO Reference ID: 3078262')
        # And I should see "Name: (2017 YR1)"
        # And I should see "NEO Reference ID: 3794979"
        expect(page).to have_content('Name: (2017 YR1)')
        expect(page).to have_content('NEO Reference ID: 3794979')
      end
    end
  end
end

# Feature: A guest user visits the root page and enters a start date and end date. The resulting page will display the most dangerous day in that range based on which day has the most `is_potentially_dangerous_asteroid` set to `true`. Given the scenario below, it should be January 1, 2018 with 3 potentially dangerous asteroids.



