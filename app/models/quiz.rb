class Quiz < ActiveRecord::Base

  def self.update_count(correct_or_incorrect)
    update(correct_count: correct_or_incorrect+1)
  end

end
