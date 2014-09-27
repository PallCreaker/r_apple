class Score < ActiveRecord::Base
  
  def self.my_score(user_id)
    self.where(user_id:user_id)
  end

  def self.select_time_score(user_id, from, to)
    self.where(user_id:user_id, created_at:from...to).maximum("score")
  end

end
