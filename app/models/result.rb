class Result < ActiveRecord::Base
  belongs_to :competition
  belongs_to :my_score, class_name: Score, foreign_key: :my_socore_id
  belongs_to :competition_score, class_name: Score, foreign_key: :competition_socore_id
end
