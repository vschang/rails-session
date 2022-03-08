class FriendshipsController < ApplicationController
  before_action :get_user
  
  def get_user
    @username = current_user.username
    @user_now = RSpotify::User.find(current_user.uid)
    @full_name = @user_now.display_name
    @all_playlists = @user_now.playlists
    @prof_pic_url = @user_now.images[0]["url"]
  end

  def create
    @user = current_user
    @receiver = User.find(friendship_params[:receiver_id])
    @friendship = Friendship.new(requester_id: @user.id, receiver_id: @receiver.id)
    @friendship.receiver = @receiver

    if @friendship.save
      redirect_to friendships_path, notice: "Friend request sent!"
    else
      redirect_to friendships_path, alert: "Cannot make a friend request"
    end
  end

  def accept
    @friendship = Friendship.find(params[:id])
    @friendship.update(status: "accepted")
    redirect_to friendships_path
  end

  def reject
    @friendship = Friendship.find(params[:id])
    @friendship.update(status: "rejected")
    redirect_to friendships_path
  end

  def destroy
    @friendship = Friendship.find(params[:id])

    @friendship.destroy
    redirect_to friendships_path
  end

  def index
    @user = current_user
    @friendship = Friendship.new

    # # friends are those whose status is accepted and the requester is current user or all friends where the status is accepted and the receiver is current user
    @friends = Friendship.all.where(status: "accepted").where(requester_id: @user.id).or(Friendship.all.where(status: "accepted").where(receiver_id: @user.id))
    # @friends2 = Friendship.all.where(status: "accepted")

    # YOUR REJECTED AND ACCEPTED FRIENDS
    @friends_and_enemies = Friendship.all.where(status: "accepted").or(Friendship.all.where(status: "rejected"))

    # YOUR FRIEND REQUESTS PENDING YOU REQUEST - these are the requests you shouldn't see but are showing
    @pending_friend_request = Friendship.all.where(requester_id: @user.id, status: "pending")

    # YOUR FRIEND REQUESTS PENDING YOU RECEIVE - these are the only requests you hosuld see
    @pending_friends_receive = Friendship.all.where(receiver_id: @user.id, status: "pending")

    # ALL PENDING FRIENDS
    @pending_friends = @pending_friend_request + @pending_friends_receive
  end

  private

  def friendship_params
    params.require(:friendship).permit(:requester_id, :receiver_id, :status)
  end
end
