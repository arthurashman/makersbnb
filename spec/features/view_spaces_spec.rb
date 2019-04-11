require 'pg'
require 'database_connection'

feature 'View Makersbnb listed spaces' do

  scenario 'user can see listed spaces' do
    PG.connect(dbname: 'makersbnb_test')
    Space.create(user_id: 1 ,title: "Beautiful Home", description: "Beautiful home in Yorkshire", price_per_night: 50, date_from: "2019-05-01", date_to: "2019-05-31")
    
    visit '/spaces'
    expect(page).to have_content 'Beautiful Home'
    expect(page).to have_content 'Beautiful home in Yorkshire'
  end

  scenario 'if user is not logged in, then a log in button is present to entice the user to login' do
    Space.create(user_id: 1 ,title: "Beautiful Home", description: "Beautiful home in Yorkshire", price_per_night: 50, date_from: "2019-05-01", date_to: "2019-05-31")
    visit '/spaces'
    expect(page).to have_content 'Log in'

  end

  scenario 'if user is logged in, then a log out button is present so the user can sign out' do
    User.create(fullname: 'Riya Dattani', email: 'test@example.com', password: 'password123')
    Space.create(user_id: 1, title: "Beautiful Home", description: "Beautiful home in Yorkshire", price_per_night: 50, date_from: "2019-05-01", date_to: "2019-05-31")
    visit '/log_in'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Log in')
    expect(page).to have_current_path("/spaces")
    expect(page).not_to have_content 'Log in'
    expect(page).to have_content 'Log out'
  end

end
