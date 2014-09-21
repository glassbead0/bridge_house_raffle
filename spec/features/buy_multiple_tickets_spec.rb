require 'rails_helper'

feature 'buy multiple tickets' do
  scenario 'a user buys multiple tickets' do

    expect {
      visit '/'
      fill_out_ticket
      select '12', from: 'Number of tickets'
      click_button 'Buy Ticket'
      expect(page).to have_text 'Thank you for buying 12 raffle tickets Aaron'
    }.to change(Ticket, :count).by(12)

  end
end
