require 'sinatra'
require_relative 'config/application'
require 'pry'

set :bind, '0.0.0.0'  # bind to all interfaces

helpers do
  def current_user
    if @current_user.nil? && session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
      session[:user_id] = nil unless @current_user
    end
    @current_user
  end
end

get '/' do
  redirect '/meetups'
end

get '/auth/github/callback' do
  user = User.find_or_create_from_omniauth(env['omniauth.auth'])
  session[:user_id] = user.id
  flash[:notice] = "You're now signed in as #{user.username}!"


  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

  redirect '/'
end

get '/meetups' do
  @meetups = Meetup.order(:name)
  erb :'meetups/index'
end

get '/meetups/:id' do
  id = params[:id]
  @meetup = Meetup.find(id)
  erb :'meetups/show'
end

post '/meetups/:id' do
  meetup_id = params[:id]
  @meetup = Meetup.find(meetup_id)
  if current_user.nil?
    flash[:notice] = "You need to sign in!"
    erb :'meetups/show'
  elsif
    @meetup.users.include?(current_user)
    flash[:notice] = "You are already attending!"
    erb :'meetups/show'
  else
    user = current_user
    @meetup.users << user
    @meetup.save

    redirect "/meetups/#{meetup_id}"
  end
end

get '/meetups/show/new' do
  @creator = current_user
  erb :'meetups/new'
end

post '/meetups/show/new' do
  @name = params[:name]
  @description = params[:description]
  @location = params[:location]

  if current_user.nil?
    flash[:notice] = "You need to sign in!"
    erb :'/meetups/new'
  else
    @creator = current_user.username
    meetup = Meetup.create(name: @name, description: @description, location: @location, creator: @creator)

    redirect "/meetups/#{meetup.id}"
  end
end
