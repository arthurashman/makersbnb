feature 'User books a space' do
  scenario 'User requests for a space and has a pending request' do
    User.create(fullname: 'Riya Dattani', email: 'test@example.com', password: 'password123')
    Space.create(user_id: 1, title: "Beautiful Home", description: "Beautiful home in Yorkshire", price_per_night: 50, date_from: "2019-05-01", date_to: "2019-05-31")
    visit '/log_in'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Log in')
    click_button('See more')
    fill_in(:chosen_date, with: "2019-05-20")
    click_button('Request')

    expect(page).to have_content('Beautiful home')
    expect(page).to have_content('2019-05-20')
  end

  # scenario 'User requests for a space and it is unavailable' do
  # end
end
