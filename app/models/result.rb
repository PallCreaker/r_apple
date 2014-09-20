class Result < ActiveRecord::Base
  belongs_to :competition_result, class_name: Competition, foreign_key: :competition_id
  belongs_to :my_score, class_name: Score, foreign_key: :my_score_id
  belongs_to :competition_score, class_name: Score, foreign_key: :competition_score_id
end
