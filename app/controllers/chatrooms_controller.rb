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
    #chatrooms should be ordered by the last message that was sent
    @chatrooms = current_user.chatrooms

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

    @message_time = []
    time_now = Time.now

    @chatrooms.each do |chatroom|
      unless chatroom.messages.empty?
        time_diff = time_now - chatroom.messages.last.created_at
        if time_diff < 60.0
          @message_time << "now"
        elsif time_diff < 3600.0
          @message_time << "#{(time_diff / 1.minute).to_i.round}m"
        elsif time_diff > 3600.0 && time_diff < 86400.0
          @message_time << "#{(time_diff / 1.hour).to_i.round}h"
        elsif time_diff > 86400.0 && time_diff < 604800.0
          @message_time << "#{(time_diff / 1.day).to_i.round}d"
        else
          @message_time << "#{(time_diff / 1.week).to_i.round}w"
        end
      else
        @message_time << "new"
      end
    end

    @chatrooms_in_order = []
    @chatrooms_without_messages = @chatrooms.select{ |chatroom| chatroom.messages.empty? }
    # most recently created empty chatroom
    @chatrooms_without_messages = @chatrooms_without_messages.sort_by {|chatroom| chatroom.created_at}.reverse
    @chatrooms_with_messages = @chatrooms - @chatrooms_without_messages
    # most recent message in nonempty chatroom
    @chatrooms_with_messages = @chatrooms_with_messages.sort_by {|chatroom| chatroom.messages.last.created_at}.reverse

    @chatrooms_in_order << @chatrooms_without_messages
    @chatrooms_in_order << @chatrooms_with_messages
    @chatrooms_in_order.flatten!

  end

  def show
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

    @chatroom = Chatroom.find(params[:id])
    @chatrooms = current_user.chatrooms
    @message = Message.new

    @message_time = []
    time_now = Time.now
    @chatrooms.each do |chatroom|
      unless chatroom.messages.empty?
        time_diff = time_now - chatroom.messages.last.created_at
        if time_diff < 60.0
          @message_time << "now"
        elsif time_diff < 3600.0
          @message_time << "#{(time_diff / 1.minute).to_i.round}m"
        elsif time_diff > 3600.0 && time_diff < 86400.0
          @message_time << "#{(time_diff / 1.hour).to_i.round}h"
        elsif time_diff > 86400.0 && time_diff < 604800.0
          @message_time << "#{(time_diff / 1.day).to_i.round}d"
        else
          @message_time << "#{(time_diff / 1.week).to_i.round}w"
        end
      else
        @message_time << "new"
      end
    end

    @chatrooms_in_order = []
    @chatrooms_without_messages = @chatrooms.select{ |chatroom| chatroom.messages.empty? }
    # most recently created empty chatroom
    @chatrooms_without_messages = @chatrooms_without_messages.sort_by {|chatroom| chatroom.created_at}.reverse
    @chatrooms_with_messages = @chatrooms - @chatrooms_without_messages
    # most recent message in nonempty chatroom
    @chatrooms_with_messages = @chatrooms_with_messages.sort_by {|chatroom| chatroom.messages.last.created_at}.reverse

    @chatrooms_in_order << @chatrooms_without_messages
    @chatrooms_in_order << @chatrooms_with_messages
    @chatrooms_in_order.flatten!
  end

  def update
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
