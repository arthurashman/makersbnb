ALTER TABLE bookings DROP COLUMN space_id;
ALTER TABLE bookings ADD COLUMN space_id INTEGER REFERENCES spaces(id);

