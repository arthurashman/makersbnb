require 'sinatra/base'
require 'sinatra/flash'
require './database_connection_setup'
require './lib/user.rb'


class Makersbnb < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :homepage
  end

  post '/sign_up' do
    user = User.create(fullname: params[:fullname], email: params[:email], password: params[:password])
    session[:email] = user.email
    redirect '/spaces'
  end

  get '/spaces' do
    erb :spaces
  end

  get '/log_in' do
    erb :log_in
  end

  post '/log_in' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:email] = user.email
      redirect '/spaces'
    else
      flash[:notice] = 'Please check your email or password.'
      redirect '/log_in'
    end
  end

  run! if app_file == $0
end
