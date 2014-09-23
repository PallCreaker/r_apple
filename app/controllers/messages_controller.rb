class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :message_confirm_status

  def index
    @all_messages = Message.where(user_id: current_user.id, partner_id: current_user.competitions.last.competition_id)
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    @message.partner_id = current_user.competitions.last.competition_id

    respond_to do |format|
      if @message.save
        format.html { redirect_to :controller => "messages", :action => "index" }
      else
        format.html { render :index }
      end
    end
  end

  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
    end
  end

  private
    def message_confirm_status
      confirm_status unless current_user.status == 3
      # TODO: win_countを計算する
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:content)
    end
end
