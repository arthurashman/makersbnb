require 'sinatra/base'
require './lib/space.rb'
require './database_connection_setup'


class Makersbnb < Sinatra::Base
  get '/homepage' do
    erb :homepage
  end

  post '/sign_up' do
    redirect '/spaces'
  end

  get '/spaces' do
    @all_spaces = Space.all
    erb :spaces
  end

  run! if app_file == $0
end
