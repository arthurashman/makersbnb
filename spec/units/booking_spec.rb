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
end
