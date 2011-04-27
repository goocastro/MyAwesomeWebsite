require 'rubygems'
require 'sinatra'
require 'haml'    #must be loaded after sinatra
require 'instagram'

get '/' do
  @images = instArray()
  haml :index
end

get '/screen.css' do
  scss :screen
end

# get instagram array
def instArray
  cache_filename = 'tmp/instagram_cache.yaml'
  pic_list = []

  if !File.exist?(cache_filename.to_s)
    File.open( cache_filename , 'w') {|f| f.write('') }
  end

  if File.ctime( cache_filename ) - Time.now < -60 || File.size( cache_filename ) < 5
    puts "=> getting data from from api"
    client = Instagram.client(:access_token => "895827.f59def8.68edfeb4b2d94ca59b90ecde732e7eff")
    pic_list = client.user_recent_media

    File.open( cache_filename , "w+" ) do |out|
      out << pic_list.to_yaml
    end
  else
    puts "=> getting data from file"
    pic_list = YAML.load(File.open( cache_filename )) 
  end

  return pic_list
end
