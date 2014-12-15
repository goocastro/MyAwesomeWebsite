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
  images = getInstagrams
  @images = images['data']
  offset = 0
  @offset = offset
  haml :index
  #{ :key1 => 'value1', :key2 => 'value2' }.to_json
end

get '/app.js' do
  coffee :app
end

get '/more' do
  @images = getInstagrams(params['mid'])['data']
  haml :_list, :layout => false
end

############################################
##### get instagram array
############################################
def getInstagrams(maxid = '')
  cache_filename = 'tmp/instagram_cache.yaml'
  pic_list = []

  if !File.exist?(cache_filename.to_s)
    File.open( cache_filename , 'w') {|f| f.write('') }
  end

  if true
  #if File.ctime( cache_filename ) - Time.now < -1 || File.size( cache_filename ) < 5
    puts "=> getting data from from api"
    url = "https://api.instagram.com/v1/users/895827/media/recent/?client_id=195fdfcae4844c3b8553e894236f5ada&count=20&max_id=" + maxid
    p url
    resp = Net::HTTP.get_response(URI.parse(url))
    pic_list = JSON.parse(resp.body)

    File.open( cache_filename , "w+" ) do |out|
      out << pic_list.to_yaml
    end
  else
    puts "=> getting data from file"
    pic_list = YAML.load(File.open( cache_filename ))
  end

  return pic_list
end
