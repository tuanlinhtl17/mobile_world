class PagesController < ApplicationController
  def index
    @mobiles = Mobile.desc_create_time.limit Settings.pages.limit_mobile
    @advertisements = Advertisement.newest_ads
  end
end
