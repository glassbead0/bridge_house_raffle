require 'rails_helper'

feature 'admin can see all tickets' do
  scenario 'cant see list if not admin' do
    visit '/tickets'

    expect(page).to have_text 'not authorized'
    expect(page).to_not have_text 'All Purchased Tickets'
  end

  scenario 'admin can see all tickets' do
    visit '/admins/sign_up'
    fill_in 'Email', with: 'glassbead@gmail.com'
    fill_in 'Password', with: 'somePassword'
    fill_in 'Password confirmation', with: 'somePassword'
    fill_in 'Bridge house pin', with: '5280'

    click_button 'Create Admin Account'

    click_link 'All Tickets'

    expect(page).to have_text 'All Purchased Tickets'
  end
end
