require 'database_helpers'
require 'booking'
require 'user'
require 'space'


describe Booking do

  before(:each) do
    @owner = User.create(fullname: 'Riya Dattani', email: 'test@example.com', password: 'password123')
    @requester = User.create(fullname: 'Yoda', email: 'yoda@example.com', password: 'password123')
    @space = Space.create(user_id: @owner.id ,title: "Beautiful Home", description: "Beautiful home in Yorkshire", price_per_night: 50, date_from: "2019-05-01", date_to: "2019-05-31")
  end

  describe '.request' do

    it 'creates a new booking' do
      booking = Booking.request(requester_id: @requester.id, space_id: @space.id, date:'2019-05-20', confirmation: "false")
      persisted_data = persisted_data(table: :bookings, id: booking.id)

      expect(booking).to be_a Booking
      expect(booking.id).to eq persisted_data['id']
      expect(booking.date).to eq '2019-05-20'
    end
  end

  describe '#available?' do
    it 'checks if the space is available' do
      booking = Booking.request(requester_id: @requester.id, space_id: @space.id, date:'2019-05-20', confirmation: "false")
      expect(booking.available?(space_id: booking.space_id, date:'2019-05-20')).to be true
    end

    it 'checks if the space is available' do
      booking = Booking.request(requester_id: @requester.id, space_id: @space.id, date:'2019-05-20', confirmation: "true")
      expect(booking.available?(space_id: booking.space_id, date:'2019-05-20')).to be false
    end
  end

  describe '.find' do
    it 'finds a booking by space id' do
      booking = Booking.request(requester_id: @requester.id, space_id: @space.id, date:'2019-05-20', confirmation: "true")
      result = Booking.find(space_id: booking.space_id)

      expect(result.id).to eq booking.id
      expect(result.date).to eq booking.date
      expect(result.confirmation).to eq booking.confirmation
    end

    it 'returns nil if there is no space_id given' do
      expect(Booking.find(space_id: nil)).to eq nil
    end
  end

  describe '.all' do
    it 'returns all requests made by the user' do
      Booking.request(requester_id: @requester.id, space_id: @space.id, date:'2019-05-20', confirmation: "true")

      bookings = Booking.all

      expect(bookings.first.date).to eq '2019-05-20'
    end
  end

  describe '.confirm' do
    it 'updates the booking confirmation to true' do
      booking = Booking.request(requester_id: @requester.id, space_id: @space.id, date:'2019-05-20', confirmation: "false")
      Booking.confirm(requester_id: @requester.id, space_id: @space.id, date: booking.date)

      expect(booking.available?(space_id: booking.space_id, date:'2019-05-20')).to be false
    end
  end
end
