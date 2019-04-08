require 'database_connection'

describe DatabaseConnection do
  describe '#setup' do
    it 'sets up a connection to the database through PG gem - object' do
      expect(PG).to receive(:connect).with(dbname: 'makersbnb_test')

      DatabaseConnection.setup('makersbnb_test')
    end


    it 'checks that the connection is persistent' do
      connection = DatabaseConnection.setup('makersbnb_test')

      expect(DatabaseConnection.connection).to eq connection
    end

  end

  describe '#query' do
    it 'executes a query via PG' do
      connection = DatabaseConnection.setup('makersbnb_test')
  
      expect(connection).to receive(:exec).with("SELECT * FROM spaces;")
  
      DatabaseConnection.query("SELECT * FROM spaces;")
    end
  end

end