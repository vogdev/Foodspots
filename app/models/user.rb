class User < ApplicationRecord
   mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  has_many :votes
  acts_as_voter


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.username = auth.info.name
      # user.avatar_file_name = auth.info.image
      # user.avatar = URI.parse("https://graph.facebook.com/v2.6/#{auth.uid}/picture?type=large")
      user.remote_avatar_url = auth.info.image.gsub('http://','https://')
      user.password = Devise.friendly_token[0,20]
    end
  end
end
