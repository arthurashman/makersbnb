require 'sinatra/base'
require './database_connection_setup'
require './lib/user.rb'


class Makersbnb < Sinatra::Base
  get '/homepage' do
    erb :homepage
  end

  post '/sign_up' do
    user = User.create(fullname: params[:fullname], email: params[:email], password: params[:password])
    redirect '/spaces'
  end

  get '/spaces' do
    erb :spaces
  end

  run! if app_file == $0
end
