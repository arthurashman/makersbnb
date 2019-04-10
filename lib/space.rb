require 'pg'
require './lib/database_connection.rb'

class Space

  attr_reader :id, :title, :description, :price_per_night, :date_from, :date_to

  def initialize(id:, title:, description:, price_per_night:, date_from:, date_to:)
    @id = id
    @title = title
    @description = description
    @price_per_night = price_per_night
    @date_from = date_from
    @date_to = date_to
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM spaces")
    result.map do |space|
      Space.new(
        id: space['id'],
        title: space['title'],
        description: space['description'],
        price_per_night: space['price_per_night'],
        date_from: space['date_from'],
        date_to: space['date_to']
      )
    end
  end

  def self.create(title:, description:, price_per_night:, date_from:, date_to:)
    result = DatabaseConnection.query(
    "INSERT INTO spaces (title, description, price_per_night, date_from, date_to) 
    VALUES(
      '#{title}', 
      '#{description}', 
      '#{price_per_night}', 
      '#{date_from}', 
      '#{date_to}'
      ) 
    RETURNING id, title, description, price_per_night, date_from, date_to;"
    )
    Space.new(
      id: result[0]['id'], 
      title: result[0]['title'], 
      description: result[0]['description'], 
      price_per_night: result[0]['price_per_night'], 
      date_from: result[0]['date_from'], 
      date_to: result[0]['date_to']
      )
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM spaces WHERE id = '#{id.to_i}'")
    Space.new(
      id: result[0]['id'], 
      title: result[0]['title'], 
      description: result[0]['description'], 
      price_per_night: result[0]['price_per_night'], 
      date_from: result[0]['date_from'], 
      date_to: result[0]['date_to']
      )
  end
end