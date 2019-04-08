require './lib/database_connection'

#The db connection is set up with this script when the application boots (app.rb)

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('makersbnb_test')
else
  DatabaseConnection.setup('makersbnb')
end