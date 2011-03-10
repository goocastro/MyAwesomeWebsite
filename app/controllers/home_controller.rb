class HomeController < ApplicationController
  def index
    client = Instagram.client(:access_token => "895827.f59def8.68edfeb4b2d94ca59b90ecde732e7eff")

    @image = client.user_recent_media.first.images.standard_resolution.url
    
  end

end
