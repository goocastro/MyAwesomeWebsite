require 'rubygems'
require 'sinatra'
require 'haml'
require 'instagram'
require 'json'
require 'yaml'
require 'coffee-script'
require 'net/http'

images = []
offset = 0

get '/' do
  images = getInstagrams()
  @images = images
  offset = 0
  @offset = offset
  haml :index
end

get '/app.js' do
  coffee :app
end

get '/more' do
  offset += 10
  @images = images
  @offset = offset
  haml :_list, :layout => false
end

############################################
##### get instagram array
############################################
def getInstagrams
  cache_filename = 'tmp/instagram_cache.yaml'
  pic_list = []

  if !File.exist?(cache_filename.to_s)
    File.open( cache_filename , 'w') {|f| f.write('') }
  end

  if true
  #if File.ctime( cache_filename ) - Time.now < -60 || File.size( cache_filename ) < 5
    puts "=> getting data from from api"
    begin
      client = Instagram.client(:access_token => "895827.f59def8.68edfeb4b2d94ca59b90ecde732e7eff")
    rescue
      pic_list = []
    ensure
      pic_list = client.user_recent_media(:count => 300)
    end

    File.open( cache_filename , "w+" ) do |out|
      out << pic_list.to_yaml
    end
  else
    puts "=> getting data from file"
    pic_list = YAML.load(File.open( cache_filename ))
  end

  return pic_list
end
