class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :message_confirm_status, :set_html_class, :set_message

  def index
  end

  #宣戦布告された人のチャット画面
  def proclamation
    @all_messages = Message.where(competition_id: params[:id])
  end

  def reply
    @message = Message.new(message_params)
    @message.from_id = current_user.id
    @message.to_id = Competition.find(params[:id]).enemy_id
    @message.competition_id = params[:id]
    respond_to do |format|
      if @message.save
        format.html { redirect_to :controller => "messages", :action => "proclamation" }
      else
        format.html { render :proclamation }
      end
    end
  end

  def create
    @message = Message.new(message_params)
    @message.from_id = current_user.id
    @message.to_id = current_user.competitions.last.enemy_id
    @message.competition_id = current_user.competitions.last.id

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
      confirm_status unless current_user.status == 'complete_enemy'
      # TODO: win_countを計算する
      @win_count = 3
    end

    def set_message
      @message = Message.new
      @all_messages = Message.where(competition_id: current_user.competitions.last.id)
      @enemy = User.find(current_user.competitions.last.enemy_id) # 同じ相手を宣戦布告する場合があるため、最新の宣戦布告相手を取得
    end

    def set_html_class
      @title = 'Chat'
      @style_content = 'content-footer'
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:content)
    end
end
