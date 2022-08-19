class ChatroomsController < ApplicationController
  before_action :authenticate_user!


  def index
    @chatrooms = Chatroom.all
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    opentok = OpenTok::OpenTok.new '47557071', '5d3a8f493e5219176682adf8f82d924be6afe32b'
    @token = opentok.generate_token @chatroom.vonage_session_id, { name: current_user.nickname }
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)

    respond_to do |format|
      if @chatroom.save
        format.html { redirect_to chatroom_url(@chatroom), notice: "chatRoom was successfully created." }
        format.json { render :show, status: :created, location: @chatroom }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chatroom.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name, :vonage_session_id)
  end

end
