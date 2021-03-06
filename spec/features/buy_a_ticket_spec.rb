require 'rails_helper'

feature 'buy a ticket' do
  scenario 'can buy one ticket' do
    visit '/'

    fill_in 'Name: First', with: 'Aaron'
    fill_in 'Last', with: 'Glasenapp'
    fill_in 'Email', with: 'glassbead@gmail.com'
    check 'Receive BH Emails'
    fill_in 'Address line one', with: '123 Something St.'
    fill_in 'Address line two', with: 'apt 1A'
    fill_in 'City', with: 'Boulder'
    fill_in 'State', with: 'CO'
    fill_in 'Zip code', with: '80304'
    fill_in 'Phone number', with: '123-456-7890'

    click_button 'Buy Tickets'

    expect(ActionMailer::Base.deliveries).to have(1).email
    expect(page).to have_text "Thank you for buying 1 raffle ticket Aaron"
    expect(page).to have _text "You will receive an email at glassbead@gmail.com to confirm your purchase shortly."

    click_button 'Buy more tickets'

    expect(page).to_not have_text 'Payment type'
  end
end
