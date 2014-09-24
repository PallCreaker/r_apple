class Competition < ActiveRecord::Base
  has_many :result
  belongs_to :competition_user, class_name: User, foreign_key: :competition_id
  belongs_to :user

  def self.get_enemy(user_id)
    self.where(user_id: user_id).last.competition_user
  end
end
