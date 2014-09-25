class Competition < ActiveRecord::Base
  has_many :results
  has_many :messagess
  belongs_to :competition_user, class_name: User, foreign_key: :competition_id
end
