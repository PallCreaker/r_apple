class User < ActiveRecord::Base
  has_many :competitions
  has_many :messages, through: :competitions
  has_many :scores

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :omniauthable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  enum status: {temporary: "tmp", complete_name_and_university: "cmpl_name_uni", complete_quiz: "cmpl_quiz", complete_enemy: "cmpl_en"}

  def self.find_for_facebook_oauth(auth)
    user = User.find_by(:provider => auth.provider, :fb_id => auth.uid)
    unless user
      user = User.create(
        fb_name:  auth.extra.raw_info.name,
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

  # リストアップの際以下のscopeを用いてフィルタリング
  scope :gender, -> gender_fil { where(gender: gender_fil).uniq }
  #scope :score,  -> score_fil { joins(:scores).where{ score_fil < score } }
  scope :score,  -> score_fil { joins(:scores).where(Score.arel_table[:score].gt score_fil) }
  scope :univ,   -> univ_fil { where(university: univ_fil) }

end
