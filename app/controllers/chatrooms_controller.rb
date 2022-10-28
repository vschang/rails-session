class ChatroomsController < ApplicationController
  def create
    @user = current_user
    @second_user = User.find(params[:chatroom][:second_user].to_i)

    @chatroom = Chatroom.new(first_user_id: @user.id, second_user_id: @second_user.id, name: @second_user.username)
    existing_chatroom = Chatroom.all.find_by(first_user_id: current_user.id, second_user_id: @second_user.id) || Chatroom.all.find_by(first_user_id: @second_user.id, second_user_id: current_user.id)
    if existing_chatroom
      redirect_to chatroom_path(existing_chatroom)
    else
      if @chatroom.save
        redirect_to chatroom_path(@chatroom)
      else
        render 'chatroom/index', alert: 'unable to start a chat.'
      end
    end
  end

  def index
    @chatrooms = current_user.chatrooms
    # @chatroom = Chatroom.new
    if params[:second_user].present?
      sql_query = " \
        users.first_name ILIKE :second_user \
        OR users.last_name ILIKE :second_user \
        OR users.username ILIKE :second_user \
      "
      @users = User.where(sql_query, second_user: "%#{params[:second_user]}%")
    else
      @users = []
    end
    @chatroom = Chatroom.new
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def destroy
    @chatroom = Chatroom.find(params[:id])
    @chatroom.destroy
    redirect_to chatrooms_path
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:second_user, :second_user_id, :first_user_id, :name)
  end
end
