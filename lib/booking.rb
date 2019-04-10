require 'pg'
require './lib/database_connection.rb'

class Booking
  attr_reader :id, :space_id, :date, :confirmation

  def initialize(id:, space_id:, date:, confirmation:)
    @id = id
    @space_id = space_id
    @date = date
    @confirmation = confirmation
  end

  def self.request(space_id:, date:, confirmation: "false")
    result = DatabaseConnection.query("INSERT INTO bookings (space_id, date, confirmation) VALUES('#{space_id}', '#{date}', '#{confirmation}') RETURNING id, space_id, date, confirmation;")
    Booking.new(id: result[0]['id'], space_id: result[0]['space_id'], date: result[0]['date'], confirmation: result[0]['confirmation'])
  end
end
