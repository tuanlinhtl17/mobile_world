class PagesController < ApplicationController
  def index
    @mobiles = Mobile.desc_create_time.limit Settings.pages.limit_mobile
  end
end
