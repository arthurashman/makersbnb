require 'sinatra/base'
require 'sinatra/flash'
require './database_connection_setup'
require './lib/space.rb'
require './lib/user.rb'
require './lib/booking.rb'

class Makersbnb < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :homepage
  end

  post '/sign_up' do
    if User.find(email: params[:email])
      flash[:notice] = 'You have an account, please log in.'
      redirect('/log_in')
    else
      user = User.create(fullname: params[:fullname], email: params[:email], password: params[:password])
      session[:email] = user.email
      session[:id] = user.id
      redirect '/spaces'
    end
  end

  get '/spaces' do
    @all_spaces = Space.all
    @email = session[:email]
    @user = User.find(email: @email)
    erb :spaces
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    Space.create(user_id: session[:id], title: params[:title], description: params[:description], price_per_night: params[:price_per_night], date_from: params[:date_from], date_to: params[:date_to])
    redirect '/spaces'
  end

  get '/spaces/:id' do
    @email = session[:email]
    @space = Space.find(id: params[:id])
    erb :dates
  end

  post '/request' do
    if session[:email] == nil
      flash[:notice] = 'You must be signed in to request a space.'
      redirect "/spaces/#{params[:id]}"
    else
      @booking = Booking.request(space_id: params[:space_id], date: params[:chosen_date])
      if @booking.available?(space_id: params[:space_id], date: params[:chosen_date])
        redirect "/requests/#{params[:space_id]}"
      end
    end
  end

  get '/requests/:id' do
    @all_bookings = Booking.all
    @space = Space.find(id: params[:id])
    erb :requests
  end

  get '/log_in' do
    erb :log_in
  end

  post '/log_in' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:email] = user.email
      session[:id] = user.id
      redirect '/spaces'
    else
      flash[:notice] = 'Please check your email or password.'
      redirect '/log_in'
    end
  end

  post '/log_out' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/log_in')
  end

  run! if app_file == $0
end
