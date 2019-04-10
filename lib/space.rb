require 'pg'
require './lib/database_connection.rb'

class Space

  attr_reader :user_id, :id, :title, :description, :price_per_night, :date_from, :date_to

  def initialize(user_id:, id:, title:, description:, price_per_night:, date_from:, date_to:)
    @user_id = user_id
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
        user_id: space['user_id'],
        id: space['id'],
        title: space['title'],
        description: space['description'],
        price_per_night: space['price_per_night'],
        date_from: space['date_from'],
        date_to: space['date_to']
      )
    end
  end

  def self.create(user_id:, title:, description:, price_per_night:, date_from:, date_to:)
    result = DatabaseConnection.query(
    "INSERT INTO spaces (user_id, title, description, price_per_night, date_from, date_to) 
    VALUES(
      '#{user_id.to_i}',
      '#{title}', 
      '#{description}', 
      '#{price_per_night}', 
      '#{date_from}', 
      '#{date_to}'
      ) 
    RETURNING user_id, id, title, description, price_per_night, date_from, date_to;"
    )
    Space.new(
      user_id: result[0]['user_id'],
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
      user_id: result[0]['user_id'],
      id: result[0]['id'], 
      title: result[0]['title'], 
      description: result[0]['description'], 
      price_per_night: result[0]['price_per_night'], 
      date_from: result[0]['date_from'], 
      date_to: result[0]['date_to']
      )
  end
end