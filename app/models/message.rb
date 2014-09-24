class Message < ActiveRecord::Base
  belongs_to :competition

  validates :user_id, presence: true, numericality: { only_integer: true }
  validates :competition_id, presence: true, numericality: { only_integer: true }
  validates :content, presence: { message: '必須です。'}
end
