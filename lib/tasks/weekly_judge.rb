class ResultBatch
  def self.result
    User.where(status: 3).each do |user|
      user.status = 2
      user.save
    end
    Competition.all.each do |competition|
      competition.is_fin = true
      competition.save
    end
  end
end

ResultBatch.result
