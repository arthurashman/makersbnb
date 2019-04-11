feature 'View the availability of a space' do

  scenario 'User chooses a space to book' do
    Space.create(user_id: 1, title: "Beautiful Home", description: "Beautiful home in Yorkshire", price_per_night: 50, date_from: "2019-05-01", date_to: "2019-05-31")
    visit('/spaces')
    click_button('See more')
    expect(page).to have_content('Choose a date')
  end

  scenario 'User chooses a date' do
    User.create(fullname: 'Riya Dattani', email: 'test@example.com', password: 'password123')
    Space.create(user_id: 1, title: "Beautiful Home", description: "Beautiful home in Yorkshire", price_per_night: 50, date_from: "2019-05-01", date_to: "2019-05-31")
    visit '/log_in'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Log in')
    click_button('See more')
    fill_in(:availabile_dates, with: "2019-05-20")
    click_button('Request')
    expect(page).not_to have_content 'Log in'
    expect(page).to have_content('Request sent!')
  end

  scenario 'User not logged in and tries to request a booking' do
    Space.create(user_id: 1, title: "Beautiful Home", description: "Beautiful home in Yorkshire", price_per_night: 50, date_from: "2019-05-01", date_to: "2019-05-31")
    visit('/spaces')
    click_button('See more')
    fill_in(:availabile_dates, with: "2019-05-20")
    click_button('Request')
    expect(page).to have_content 'You must be signed in to request a space.'
    expect(page).to have_content 'Log in'
  end

  scenario 'user can go back to list of spaces by clicking go back to spaces button and they are redirected to view spaces' do 
    Space.create(user_id: 1, title: "Beautiful Home", description: "Beautiful home in Yorkshire", price_per_night: 50, date_from: "2019-05-01", date_to: "2019-05-31")
    visit('/spaces')
    click_button('See more')
    click_button('Go back to browse spaces')
    expect(page).to have_current_path("/spaces")
  end
  
end