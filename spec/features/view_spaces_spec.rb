require 'pg'
require 'database_connection'

feature 'View Makersbnb listed spaces' do
  scenario 'user can see listed spaces' do

    PG.connect(dbname: 'makersbnb_test')
    Space.create(title: "Beautiful Home", description: "Beautiful home in Yorkshire", price_per_night: 50, date_from: "2019-05-01", date_to: "2019-05-31")
    
    visit '/spaces'
    expect(page).to have_content 'Beautiful Home'
  end
end
