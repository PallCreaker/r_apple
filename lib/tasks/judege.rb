class ResultBatch
  def self.result
    Competition.where(is_fin: false).each do |competition|
      #今週の月曜日から最大のScoreを取得
      this_day = Date.today
      my_score = Score.where("created_at >= ? AND user_id = ?", this_day - (this_day.wday - 1), competition.user_id).order('score').last
      comp_score = Score.where("created_at >= ? AND user_id = ?", this_day - (this_day.wday - 1), competition.competition_id).order('score').last
      result = Result.new
      result.competition_id = competition.id
      if my_score.present? && comp_score.present?
        result.my_score_id = my_score.id
        result.competition_score_id = comp_score.id
        result.decision = (my_score.score >= comp_score.score)

      elsif my_score.blank? && comp_score.blank?
        result.my_score_id = Score.where(user_id: competition.user_id).order('score').first.id
        result.competition_score_id = Score.where(user_id: competition.competition_id).order('score').first.id
        result.decision = (Score.where(user_id: competition.user_id).order('score').first.score >= Score.where(user_id: competition.competition_id).order('score').first.score)

      elsif my_score.blank? && comp_score.present?
        result.my_score_id = Score.where(user_id: competition.user_id).order('score').first.id
        result.competition_score_id = comp_score.id
        result.decision = (Score.where(user_id: competition.user_id).order('score').first.score >= comp_score.score)

      elsif my_score.present? && comp_score.blank?
        result.my_score_id = my_score.id
        result.competition_score_id = Score.where(user_id: competition.competition_id).order('score').first.id
        result.decision = (my_score.score >= Score.where(user_id: competition.competition_id).order('score').first.score)
          
      end
      result.save
    end
  end
end

ResultBatch.result