feature 'View the availability of a space' do

  scenario 'User chooses a space to book' do
    user = User.create(fullname: 'Riya Dattani', email: 'test@example.com', password: 'password123')
    Space.create(user_id: user.id, title: "Beautiful Home", description: "Beautiful home in Yorkshire", price_per_night: 50, date_from: "2019-05-01", date_to: "2019-05-31")
    visit('/spaces')
    click_button('See more')
    expect(page).to have_content('Choose a date')
  end

  scenario 'User chooses a date' do
    user = User.create(fullname: 'Riya Dattani', email: 'test@example.com', password: 'password123')
    Space.create(user_id: user.id, title: "Beautiful Home", description: "Beautiful home in Yorkshire", price_per_night: 50, date_from: "2019-05-01", date_to: "2019-05-31")
    visit '/log_in'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Log in')
    click_button('See more')
    fill_in(:chosen_date, with: "2019-05-20")
    click_button('Request')
    expect(page).not_to have_content 'Log in'
    expect(page).to have_content('Requests made:')
  end

  scenario 'User not logged in and tries to request a booking' do
    owner = User.create(fullname: 'Riya Dattani', email: 'test@example.com', password: 'password123')
    Space.create(user_id: owner.id, title: "Beautiful Home", description: "Beautiful home in Yorkshire", price_per_night: 50, date_from: "2019-05-01", date_to: "2019-05-31")
    visit('/spaces')
    click_button('See more')
    fill_in(:chosen_date, with: "2019-05-20")
    expect(page).not_to have_content 'Request'
    expect(page).to have_content 'Log in'
  end

  scenario 'user can go back to list of spaces by clicking go back to spaces button and they are redirected to view spaces' do
    owner = User.create(fullname: 'Riya Dattani', email: 'test@example.com', password: 'password123')
    Space.create(user_id: owner.id, title: "Beautiful Home", description: "Beautiful home in Yorkshire", price_per_night: 50, date_from: "2019-05-01", date_to: "2019-05-31")
    visit('/spaces')
    click_button('See more')
    click_link('Browse spaces')
    expect(page).to have_current_path("/spaces")
  end

end
