class Mobile < ApplicationRecord
  has_many :order_details
  has_many :shop_mobiles
  has_many :shops, through: :shop_mobiles
  has_many :comments, dependent: :destroy
  belongs_to :maker
  has_many :mobile_colors
  has_many :colors, through: :mobile_colors
  has_many :images, dependent: :delete_all
  accepts_nested_attributes_for :images, allow_destroy: true
  mount_uploader :avatar, AvatarUploader

  include PgSearch
  pg_search_scope :search_by_query,
                  against: [:name, :ram],
                  associated_against: {
                    maker: :name
                  },
                  using: {
                    tsearch: {
                      prefix: true
                    }
                  }

  scope :search_in_range, -> min, max do
    where("price >= ? AND price <= ?", min, max).order(price: :asc)
  end

  scope :desc_create_time, -> {order(created_at: :desc)}

  def resolution
    resolution_width.to_s + "x" + resolution_height.to_s
  end

  def percent_sale_off
    if sale_time && sale_time > Time.now && older_price && older_price > price
      percent = ((older_price - price) * 100 / older_price).to_i
      "-#{percent}%"
    end
  end

  class << self
    def search params
      if params[:min].present? && params[:max].present? && params[:query].present?
       @mobiles = Mobile.search_by_query(params[:query])
                        .search_in_range(params[:min].to_i, params[:max].to_i)
                        .page params[:page]
      elsif params[:query].present?
        @mobiles = Mobile.search_by_query(params[:query]).page params[:page]
      elsif params[:min].present? && params[:max].present?
       @mobiles = Mobile.search_in_range(params[:min].to_i, params[:max].to_i)
                                         .page params[:page]
      else
        @mobiles = Mobile.all.page params[:page]
      end
    end
  end
end
