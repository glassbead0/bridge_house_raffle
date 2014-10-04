require 'rails_helper'

feature 'buy a ticket with cash, check, square other' do
  scenario 'see above' do
    admin = FactoryGirl.create(:admin)
    login(admin)

    click_link 'Set Payment Type'

    select 'Square', from: 'Payment type'
    select '5', from: 'Number of tickets'
    fill_in 'Last four digits of card', with: '1234'
    click_button 'Hide'

    expect(page).to_not have_text 'Payment type'

    stubbed_ticket = FactoryGirl.build_stubbed(:ticket)
    fill_out_ticket(stubbed_ticket)

    expect(page).to have_text '5 tickets'
    expect(page).to have_text '$50'

    click_link 'Buy tickets'

    expect(page).to have_text 'Thank You!'
    expect(page).to have_text "You will receive an email at #{ticket.email} to confirm your purchase shortly."
    expect(ActionMailer::Base.deliveries).to have(1).email

    click_button 'Buy more tickets'

    expect(page).to have_text 'Payment type'

  end
end
