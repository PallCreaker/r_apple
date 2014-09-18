class Result < ActiveRecord::Base
  belongs_to :competition_id
  has_one :my_socore_id, :class_name => "Score"
end
