
feature 'owner can confirm or deny a space' do
  scenario 'Owner can see requests for their spaces' do
    owner = User.create(fullname: 'Riya Dattani', email: 'test@example.com', password: 'password123')
    Space.create(user_id: owner.id, title: "Beautiful Home", description: "Beautiful home in Yorkshire", price_per_night: 50, date_from: "2019-05-01", date_to: "2019-05-31")
    requester = User.create(fullname: 'Yoda', email: 'yoda@example.com', password: 'password123')
    visit '/log_in'
    fill_in('email', with: 'yoda@example.com')
    fill_in('password', with: 'password123')
    click_button('Log in')
    click_button('See more')
    fill_in(:chosen_date, with: "2019-05-20")
    click_button('Request')

    click_button('Log out')
    visit '/log_in'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Log in')
    click_button('My requests')

    click_button('Confirm')
    click_button('Log out')

    visit '/log_in'
    fill_in('email', with: 'yoda@example.com')
    fill_in('password', with: 'password123')
    click_button('Log in')
    click_button('My requests')

    expect(page).to have_content('Your booking has been confirmed')
  end
end
