class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :image_paths

  def image_paths
    client = Instagram.client(:access_token => "895827.f59def8.68edfeb4b2d94ca59b90ecde732e7eff")

    @image1 = client.user_recent_media.first.images.standard_resolution.url
    @image2 = client.user_recent_media[2].images.standard_resolution.url
    @image3 = client.user_recent_media[3].images.standard_resolution.url
    @image4 = client.user_recent_media[4].images.standard_resolution.url
    @image5 = client.user_recent_media[5].images.standard_resolution.url
    @image6 = client.user_recent_media[6].images.standard_resolution.url
    @image7 = client.user_recent_media[7].images.standard_resolution.url
    #@image = 'nietzsche.png'
  end

end
