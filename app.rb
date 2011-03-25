require 'rubygems'
require 'sinatra'
require 'haml'    #must be loaded after sinatra
require 'instagram'


get '/' do
  client = Instagram.client(:access_token => "895827.f59def8.68edfeb4b2d94ca59b90ecde732e7eff")
  @images = client.user_recent_media

  haml :index
end

get '/screen.css' do
  scss :screen
end

