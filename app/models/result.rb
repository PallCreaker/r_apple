class Result < ActiveRecord::Base
  belongs_to :my_score, class_name: Score, foreign_key: :my_score_id
  belongs_to :competition_score, class_name: Score, foreign_key: :competition_score_id

  def self.get_result(enemy_user_id)
    self.where(competition_id:enemy_user_id)
  end
end
