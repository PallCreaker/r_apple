require "date"

class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    confirm_status
    date = Date.today
    from = date.beginning_of_week
    @myscore = []
    @enemyscore = []
    1.upto(7){|day|
      @myscore.push(Score.where(user_id:current_user.id, created_at:from...from+day).maximum('score'))
    }
    1.upto(7){|day|
      @enemyscore.push(Score.where(user_id:Competition.where(user_id:current_user.id, created_at:from...from+day)).maximum('score'))
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
