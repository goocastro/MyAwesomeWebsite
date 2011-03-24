require 'rubygems'
require 'sinatra'
require 'haml'    #must be loaded after sinatra
require 'instagram'


get '/' do

  @image1 = client.user_recent_media.first.images.standard_resolution.url
  @image2 = client.user_recent_media[2].images.standard_resolution.url
  @image3 = client.user_recent_media[3].images.standard_resolution.url
  @image4 = client.user_recent_media[4].images.standard_resolution.url
  @image5 = client.user_recent_media[5].images.standard_resolution.url
  @image6 = client.user_recent_media[6].images.standard_resolution.url
  @image7 = client.user_recent_media[7].images.standard_resolution.url  

  haml :index
end

get '/screen.css' do
  scss :screen
end

