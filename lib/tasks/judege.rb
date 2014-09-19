class ResultBatch
  def self.result
    Competition.where(is_fin: false).each do |competition|
      Score.where("created_at >= ?",Date.yesterday)
    end
  end
end

ResultBatch.result