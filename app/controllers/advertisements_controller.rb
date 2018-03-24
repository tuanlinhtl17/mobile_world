class AdvertisementsController < ApplicationController
  def update
    @ads = Advertisement.find_by id: params[:ads_id].to_i
    puts "Cannot update number of clicks" unless @ads && update_ads(@ads)
  end

  private
  def update_ads ads
    number_of_clicks = ads.number_of_clicks + 1
    ads.update_attributes number_of_clicks: number_of_clicks
  end
end
