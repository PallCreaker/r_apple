class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    if status == 2
      confirm_status
    end
    date = DateTime.now
    from = date.beginning_of_week
    week_day = date.wday

    @my_score = []
    @enemy_score = []
    1.upto(7){|day|
      if day <= week_day
        @my_score.push(Score.where(user_id:current_user.id, created_at:from...from+day).maximum('score'))
        @enemy_score.push(Score.where(user_id:Competition.where(user_id:current_user.id, created_at:from...from+day)).maximum('score'))
      else
        @my_score.push(nil)
        @enemy_score.push(nil)
      end
    }

    @competition_username = Competition.where(user_id:current_user.id).last.competition_user.user_name
    @my_competition = Result.where(competition_id:Competition.where(user_id:current_user.id).last.competition_user.id)

    @win_count = 0
    @loose_count = 0
    @my_competition.each do |mc|
      if mc.decision == true
        @win_count += 1
      else
        @loose_count += 1
      end
    end
  end
end
