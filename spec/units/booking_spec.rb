require 'database_helpers'
require 'booking'
require 'user'
require 'space'


describe Booking do
  describe '.request' do

    it 'creates a new booking' do
      booking = Booking.request(requester_id: 1, space_id: 1, date:'2019-05-20', confirmation: "false")
      persisted_data = persisted_data(table: :bookings, id: booking.id)

      expect(booking).to be_a Booking
      expect(booking.id).to eq persisted_data['id']
      expect(booking.date).to eq '2019-05-20'
    end
  end

  describe '#available?' do
    it 'checks if the space is available' do
      booking = Booking.request(requester_id: 1, space_id: 1, date:'2019-05-20', confirmation: "false")
      expect(booking.available?(space_id: booking.space_id, date:'2019-05-20')).to be true
    end

    it 'checks if the space is available' do
      booking = Booking.request(requester_id: 1, space_id: 1, date:'2019-05-20', confirmation: "true")
      expect(booking.available?(space_id: booking.space_id, date:'2019-05-20')).to be false
    end
  end


end
