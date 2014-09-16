class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :omniauthable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  # 通常ログイン時のuidを生成(http://easyramble.com/implement-devise-and-ominiauth-on-rails.html)
  def self.create_unique_string
    SecureRandom.uuid
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(
        name:			auth.extra.raw_info.name,
        provider:		auth.provider,
        fb_id:			auth.uid,
        email:		auth.info.email				password:		Devise.friendly_token[0,20],
        image:		auth.info.image,
        gender:		auth.extra.raw_info.gender,
      )
    user.save(:validate => false)
    end
    user
  end
end
