require 'rails_helper'

feature 'buy a ticket' do
  scenario 'can buy one ticket' do
    visit '/'

    fill_in 'First name', with: 'Aaron'
    fill_in 'Last name', with: 'Glasenapp'
    fill_in 'Email', with: 'glassbead@gmail.com'
    check 'Subscribe'
    fill_in 'Address line one', with: '123 Something St.'
    fill_in 'Address line two', with: 'apt 1A'
    fill_in 'City', with: 'Boulder'
    fill_in 'State', with: 'CO'

    click_button 'Buy Ticket'

    expect(page).to have_text "Thanks for buying a raffle ticket Aaron"
  end
end
