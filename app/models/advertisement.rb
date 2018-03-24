class Advertisement < ApplicationRecord
  belongs_to :maker
  mount_uploader :image, AdvertisementImageUploader

  scope :newest_ads, -> {order(created_at: :desc).limit(Settings.ads.max_display)}

  scope :maker_newest_ads, -> maker_id do
    where(maker_id: maker_id).newest_ads
  end
end
