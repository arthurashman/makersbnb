SELECT title, description, price_per_night, requester_id, date, space_id
FROM bookings JOIN spaces
ON bookings.space_id = spaces.id
-- WHERE requester_id = 2
