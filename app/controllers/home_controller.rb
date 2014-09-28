class HomeController < ApplicationController
  before_action :authenticate_user!, :avoidance_redirect, :set_html_class, :set_score, :set_win_loose_count, :confirm_to_message

  def index
    
  end

  def show
    @my_competition_count = Competition.my_competition(current_user.id).count
    @my_average = Score.my_score(current_user.id).average("score")
  end

  private
    def avoidance_redirect
      confirm_status unless current_user.complete_enemy?
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
          @my_score.push(Score.select_time_score(current_user.id, from, from+day))
          @enemy_score.push(Score.select_time_score(Competition.get_enemy(current_user.id), from, from+day))
        else
          @my_score.push(nil)
          @enemy_score.push(nil)
        end
      }

      @now_score = Score.select_time_score(current_user.id, from, DateTime.now)
      @new_score = Score.my_score(current_user.id).last.score
      @enemy_user = Competition.get_enemy(current_user.id)
      @my_competition = Result.get_result(Competition.my_competition(current_user.id))
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
    def confirm_to_message
      @to_messages = Message.get_my_message(current_user.id) unless Message.get_my_message(current_user.id).nil?
    end
end
