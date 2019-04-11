feature 'View the availability of a space' do

  scenario 'User chooses a space to book' do
    Space.create(user_id: 1, title: "Beautiful Home", description: "Beautiful home in Yorkshire", price_per_night: 50, date_from: "2019-05-01", date_to: "2019-05-31")
    visit('/spaces')
    click_button('See more')
    expect(page).to have_content('Choose a date')
  end

  scenario 'User chooses a date' do
    Space.create(user_id: 1, title: "Beautiful Home", description: "Beautiful home in Yorkshire", price_per_night: 50, date_from: "2019-05-01", date_to: "2019-05-31")
    visit('/spaces')
    click_button('See more')
    fill_in(:chosen_date, with: "2019-05-20")
    click_button('Request')
    expect(page).to have_content('Request sent!')
  end
end
