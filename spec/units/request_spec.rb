require 'request'
require 'database_connection'
require 'pg'
require 'space'
require 'booking'

describe Request do
  describe '.made' do
    it 'returns all the requests made by the requester' do
      connection = PG.connect(dbname: 'makersbnb_test')
      @owner = User.create(fullname: 'Riya Dattani', email: 'test@example.com', password: 'password123')
      @requester = User.create(fullname: 'Yoda', email: 'yoda@example.com', password: 'password123')
      @space = Space.create(user_id: @owner.id ,title: "Beautiful Home", description: "Beautiful home in Yorkshire", price_per_night: 50, date_from: "2019-05-01", date_to: "2019-05-31")
      Booking.request(requester_id: @requester.id, space_id: @space.id, date:'2019-05-20', confirmation: "false")

      requests_made = Request.made(requester_id: @requester.id)
      expect(requests_made.first.title).to eq 'Beautiful Home'
      expect(requests_made.first.description).to eq "Beautiful home in Yorkshire"
      expect(requests_made.first.date).to eq '2019-05-20'
    end
  end

  describe '.received' do
    it 'returns all the requests made by the requester' do
      connection = PG.connect(dbname: 'makersbnb_test')
      @owner = User.create(fullname: 'Riya Dattani', email: 'test@example.com', password: 'password123')
      @requester = User.create(fullname: 'Yoda', email: 'yoda@example.com', password: 'password123')
      @space = Space.create(user_id: @owner.id ,title: "Beautiful Home", description: "Beautiful home in Yorkshire", price_per_night: 50, date_from: "2019-05-01", date_to: "2019-05-31")
      Booking.request(requester_id: @requester.id, space_id: @space.id, date:'2019-05-20', confirmation: "false")

      requests_received = Request.received(owner_id: @owner.id)
      expect(requests_received.first.title).to eq 'Beautiful Home'
      expect(requests_received.first.description).to eq "Beautiful home in Yorkshire"
      expect(requests_received.first.date).to eq '2019-05-20'
    end
  end
end
