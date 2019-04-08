require 'sinatra/base'
require './database_connection_setup'


class Makersbnb < Sinatra::Base
  get '/' do
    "Hello World"
  end

  run! if app_file == $0
end
