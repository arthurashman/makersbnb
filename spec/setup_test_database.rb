# frozen_string_literal: true

require 'pg'

def setup_test_database
  
  connection = PG.connect(dbname: 'makersbnb_test')

  # Clear the spaces and users table
  connection.exec('TRUNCATE spaces, users;')
end
