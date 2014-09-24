require 'rails_helper'

feature 'admin can set the location for an event' do
  scenario 'create a location for event' do
    admin = FactoryGirl.create(:admin)
    login(admin)

    click_link 'Start Event'

    expect(page).to have_text 'What is the location for this event?'
    fill_in 'Location', with: 'Fall Fest'
    click_link 'Start'

    expect(page).to have_text 'Buy a Raffle Ticket'

    stubbed_ticket = FactoryGirl.build_stubbed(:ticket)
    fill_out_ticket(stubbed_ticket)
    click_link 'Buy Tickets'

    expect(Ticket.find_by(email: stubbed_ticket.email).location).to eq('Fall Fest')

    click_link 'Buy more Tickets'

    stubbed_ticket_2 = FactoryGirl.build_stubbed(:ticket)
    fill_out_ticket(stubbed_ticket_2)
    select '5', from: 'Number of tickets'
    click_link 'Buy Tickets'

    Ticket.where(email: stubbed_ticket_2.email).each do |t|
      expect(t.location).to eq('Fall Fest')
    end
  end
end
