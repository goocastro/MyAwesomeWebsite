require 'rubygems'
require 'sinatra'
require 'haml'    #must be loaded after sinatra


get '/' do
  haml :index
end

get '/screen.css' do
  scss :screen
end

