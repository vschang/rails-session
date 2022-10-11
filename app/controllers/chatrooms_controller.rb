class ChatroomsController < ApplicationController
  # def create
  #   # show a list of your friends and choose one (or more?) to start a chat with
  #   # provide a form to name the chat
  # end

  def index
    @chatrooms = Chatroom.all
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
