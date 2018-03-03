require 'sinatra'
require 'sinatra/reloader' if development?
set :public_folder, 'assets/images'

#routes

get '/' do
  @titulo = "Conversion de temperatura"
  @footer = "chachara del footer"
  erb :home
end

get '/celsius' do
  erb :celsius
end


get '/home' do
  @titulo = "Conversion de temperatura"
  @footer = "chachara del footer"
  erb :home
end

post '/celsius' do
  @celsius = params[:celsius]
  erb :celsius
end
