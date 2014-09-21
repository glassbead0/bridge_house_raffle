require 'rails_helper'

feature 'buy a ticket' do
  scenario 'can buy one ticket' do
    visit '/'

    fill_in 'First name', with: 'Aaron'
    fill_in 'Last name', with: 'Glasenapp'
    fill_in 'Email', with: 'glassbead@gmail.com'
    check 'Receive BH Emails'
    fill_in 'Address line one', with: '123 Something St.'
    fill_in 'Address line two', with: 'apt 1A'
    fill_in 'City', with: 'Boulder'
    fill_in 'State', with: 'CO'
    fill_in 'Zip code', with: '80304'
    fill_in 'Phone number', with: '123-456-7890'

    click_button 'Buy Tickets'

    expect(page).to have_text "Thanks for buying a raffle ticket Aaron"
  end
end
