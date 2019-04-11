require 'database_helpers'
require 'booking'


describe Booking do
  describe '.request' do

    it 'creates a new booking' do
      booking = Booking.request(space_id: 1, date:'2019-05-20', confirmation: "false")
      persisted_data = persisted_data(table: :bookings, id: booking.id)

      expect(booking).to be_a Booking
      expect(booking.id).to eq persisted_data['id']
      expect(booking.date).to eq '2019-05-20'
    end
  end

  describe '#available?' do
    it 'checks if the space is available' do
      booking = Booking.request(space_id: 1, date:'2019-05-20', confirmation: "false")
      expect(booking.available?(space_id: booking.space_id, date:'2019-05-20')).to be true
    end

    it 'checks if the space is available' do
      booking = Booking.request(space_id: 1, date:'2019-05-20', confirmation: "true")
      expect(booking.available?(space_id: booking.space_id, date:'2019-05-20')).to be false
    end
  end

  describe '.find' do
    it 'finds a booking by space id' do
      booking= Booking.request(space_id: 1, date:'2019-05-20', confirmation: "false")
      result = Booking.find(space_id: booking.space_id)

      expect(result.id).to eq booking.id
      expect(result.date).to eq booking.date
      expect(result.confirmation).to eq booking.confirmation
    end

    # it 'returns nil if there is no email given' do
    #   expect(User.find(email: nil)).to eq nil
    # end
  end
end
