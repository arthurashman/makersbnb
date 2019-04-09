require 'sinatra/base'
require 'sinatra/flash'
require './database_connection_setup'
require './lib/space.rb'
require './lib/user.rb'


class Makersbnb < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  post '/sign_up' do
    user = User.create(fullname: params[:fullname], email: params[:email], password: params[:password])
    session[:email] = user.email
    redirect '/spaces'
  end

  get '/spaces' do
    @all_spaces = Space.all
    erb :spaces
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    Space.create(title: params[:title], description: params[:description], price_per_night: params[:price_per_night], date_from: params[:date_from], date_to: params[:date_to])
    redirect '/spaces'
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
