class Image < ApplicationRecord
  mount_uploader :mobile_image, MobileImageUploader
  belongs_to :mobile
end
