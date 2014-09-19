class ResultBatch
  def self.result
    Competition.where(is_fin: false).each do |competition|
      my_scpre = Score.where("created_at >= ? AND user_id = ?", Date.yesterday, competition.user_id).maximum('score')
      comp_score = Score.where("created_at >= ? AND user_id = ?", Date.yesterday, competition.competition_id).maximum('score')
    end
  end
end

ResultBatch.result