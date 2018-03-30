class PagesController < ApplicationController
  def index
    @mobiles = Mobile.desc_create_time.page params[:page]
    @advertisements = Advertisement.newest_ads
    @hot_mobiles = Mobile.hot_mobile
  end
end
