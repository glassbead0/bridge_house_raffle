require 'rails_helper'

feature 'buy multiple tickets' do
  scenario 'a user buys multiple tickets' do

    expect {
      visit '/'
      stubbed_ticket = FactoryGirl.build_stubbed(:ticket)
      fill_out_ticket(stubbed_ticket)
      select '12', from: 'Number of tickets'
      click_button 'Buy Ticket'
      expect(page).to have_text 'Thank you for buying 12 raffle tickets Aaron'
    }.to change(Ticket, :count).by(12)

    expect(ActionMailer::Base.deliveries).to have(1).email
  end
end
