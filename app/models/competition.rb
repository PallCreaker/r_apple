class Competition < ActiveRecord::Base
  has_many :results
  has_many :messages
  belongs_to :competition_user, class_name: User, foreign_key: :enemy_id
  belongs_to :user

  def self.get_enemy(user_id)
    self.where(user_id: user_id).last.competition_user
  end

  def self.get_enemy_for_competion_id(competition_id)
    @competition = self.where(id: competition_id)
  end
end
