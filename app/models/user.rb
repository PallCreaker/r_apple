class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :omniauthable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :fb_id => auth.uid).first
    unless user
      user = User.create(
        name:     auth.extra.raw_info.name,
        provider: auth.provider,
        fb_id:    auth.uid,
        email:    auth.info.email,
        password: Devise.friendly_token[0,20],
        image:    auth.info.image,
        gender:   auth.extra.raw_info.gender,
      )

    end
    user
  end
end
