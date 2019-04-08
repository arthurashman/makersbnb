require 'sinatra/base'


class Makersbnb < Sinatra::Base
  get '/homepage' do
    erb :homepage
  end

  post '/sign_up' do
    redirect '/spaces'
  end

  get '/spaces' do
    erb :spaces
  end

  run! if app_file == $0
end
