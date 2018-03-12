class Mobile < ApplicationRecord
  has_many :order_details
  has_many :shop_mobiles
  has_many :images
  has_many :comments
  belongs_to :maker

  include PgSearch
  pg_search_scope :search,
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
    where("price > ? AND price < ?", min, max).order(price: :asc)
  end
end
