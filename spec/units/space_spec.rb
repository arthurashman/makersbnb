require 'space'
require 'database_connection'
require 'pg'

describe Space do
  describe '#all' do
    it 'returns all spaces from the spaces database table' do
      connection = PG.connect(dbname: 'makersbnb_test')
      Space.create(title: "Beautiful Home", description: "Beautiful home in Yorkshire", price_per_night: 50, date_from: "2019-05-01", date_to: "2019-05-31")

      spaces = Space.all

      expect(spaces.first.title).to eq 'Beautiful Home'
    end

  end
  
  describe '#create' do
    it 'makes a new space and inputs it to database' do
      space = Space.create(title: "Beautiful Home", description: "Beautiful home in Yorkshire", price_per_night: 50, date_from: "2019-05-01", date_to: "2019-05-31")
      connection = PG.connect(dbname: 'makersbnb_test')
      connection.query("SELECT * FROM spaces WHERE title = 'Beautiful Home';") 

      expect(space).to be_a Space
      expect(space.title).to eq "Beautiful Home"
    end 
  end
end