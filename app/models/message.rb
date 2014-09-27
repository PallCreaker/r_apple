class Message < ActiveRecord::Base
  belongs_to :competition

  validates :from_id, presence: true, numericality: { only_integer: true }
  validates :to_id, presence: true, numericality: { only_integer: true }
  validates :competition_id, presence: true, numericality: { only_integer: true }
  validates :content, presence: { message: '必須です'}

  def self.get_my_message(user_id)
    self.where(to_id: user_id)
  end
end
