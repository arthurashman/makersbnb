CREATE TABLE spaces (
  id SERIAL PRIMARY KEY, 
  title VARCHAR(60),
  description VARCHAR(360),
  price_per_night SMALLINT,
  date_from DATE,
  date_to DATE
);