class HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :set_html_class

  def index
    #confirm_status
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
        @my_score.push(0)
        @enemy_score.push(0)
      end
    }
    @enemy_user = Competition.get_enemy(current_user.id)
    @my_competition = Result.get_result(@enemy_user.id)

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

  private
    def set_html_class
      @title = 'HOME'
      @style_content = 'content-footer'
    end
end
