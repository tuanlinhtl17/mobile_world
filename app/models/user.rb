class User < ApplicationRecord
  attr_accessor :skip_address_validation, :skip_phonenumber_validation

  has_many :orders
  has_many :comments
  devise :database_authenticatable, :registerable,:confirmable, :lockable, 
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable,
         :omniauthable, omniauth_providers: [:facebook]

  validates :phone_number, numericality: { only_integer: true},
   length: {maximum: Settings.phone_number.max_length, 
    minimum: Settings.phone_number.min_length} unless @skip_phonenumber_validation

  validates :address, presence: true, 
    length: {minimum: Settings.address.min_length} unless @skip_address_validation

  class << self
    def from_omniauth auth
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.skip_address_validation!
        user.skip_phonenumber_validation!
        user.skip_confirmation!
      end
    end
    
    def new_with_session params, session
      super.tap do |user|
        if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
          user.email = data["email"] if user.email.blank?
        end
      end
    end
  end



  def skip_address_validation!
    self.skip_address_validation = true
  end

  def skip_phonenumber_validation!
    self.skip_phonenumber_validation = true
  end
end
