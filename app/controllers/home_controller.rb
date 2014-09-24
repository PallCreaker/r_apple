class HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :avoidance_redirect
  before_action :set_html_class
  before_action :set_score
  before_action :set_win_loose_count


  def index
    congirm_status if current_user.status == "complete_quiz"
  end

  def show
    @my_competition_count = Competition.where("user_id = ?", current_user.id).count
    @my_average = Score.where("user_id = ?", current_user.id).average("score")
    
  end

  private
    def avoidance_redirect
      if current_user.status != "complete_enemy"
        confirm_status
      end
    end

    def set_html_class
      @title = 'HOME'
      @style_content = 'content-footer'
    end

    def set_score
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

      @now_score = Score.where(user_id:current_user.id, created_at:from...DateTime.now).maximum('score')
      @enemy_user = Competition.get_enemy(current_user.id)
      @my_competition = Result.get_result(@enemy_user.id)
    end

    def set_win_loose_count
      @win_count = 0
      @loose_count = 0
      @my_competition.each do |mc|
        if mc.decision == true
          @win_count += 1
        else
          @loose_count += 1
        end
      end

      @mosaic_count = 3 - @win_count
      if @mosaic_count < 0
        @mosaic_count = 0
      end

    end
end
