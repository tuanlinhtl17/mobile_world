class User < ApplicationRecord
  enum role: [:user, :admin]

  has_many :orders
  has_many :comments
  devise :database_authenticatable, :registerable,:confirmable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable,
         :omniauthable, omniauth_providers: [:facebook]

  validates :phone_number, numericality: { only_integer: true},
   length: {maximum: Settings.phone_number.max_length,
            minimum: Settings.phone_number.min_length}

  validates :address, presence: true,
  length: {minimum: Settings.address.min_length}

  class << self
    def from_omniauth auth
      @user = User.find_by email: auth.info.email
      if @user.nil?
        @user = User.new(
          provider: auth.provider,
          uid: auth.uid,
          email: auth.info.email,
          password: Devise.friendly_token[0,20]
        )
        @user.skip_confirmation!
        @user.save! validate: false
      end
      @user
    end

    def new_with_session params, session
      super.tap do |user|
        if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
          user.email = data["email"] if user.email.blank?
        end
      end
    end
  end
end
