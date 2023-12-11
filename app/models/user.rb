class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable,
           :omniauthable, omniauth_providers: [:google_oauth2, :github, :facebook, :twitter]

  has_many :orders

def admin?
  is_admin
end

#youtube 教學版
def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    # unless user
    #    user = User.create(
    #         email: access_token.info.email,
    #         password: Devise.friendly_token[0,20]
    #      )
    # end
    # user.name = access_token.info.name
    # user.image = access_token.info.image
    # user.uid = access_token.uid
    # user.provider = access_token.provider
    # user.save
    user
end


end
