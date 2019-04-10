feature 'User books a space' do
  scenario 'User requests for a space and has a pending request' do
    Space.create(user_id: 1, title: "Beautiful Home", description: "Beautiful home in Yorkshire", price_per_night: 50, date_from: "2019-05-01", date_to: "2019-05-31")
    visit('/spaces')
    click_button('See more')
    fill_in(:availabile_dates, with: "2019-05-20")
    click_button('Request')
    expect(page).to have_content('Beautiful home')
    expect(page).to have_content('2019-05-20')
  end
end
