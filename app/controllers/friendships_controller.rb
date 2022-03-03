class FriendshipsController < ApplicationController
  before_action :get_user
  def get_user
    @username = current_user.username
    @user_now = RSpotify::User.find(current_user.uid)
    @full_name = @user_now.display_name
    @all_playlists = @user_now.playlists
    @prof_pic_url = @user_now.images[0]["url"]
  end

  # make a friend request- You=requester, friend=receiver
  # accept a friend request- You=receiver, friend=requester
  # how to ge the id of your potential friend?
  def create
    @user = current_user
    @receiver = User.find(params[:friendship][:receiver_id])
    @friendship = Friendship.new(requester_id: @user.id, receiver_id: @receiver.id, status: "pending")

    if @friendship.save
      redirect_to friendships_path, notice: "Friend request sent!"
    else
      redirect_to friendships_path, alert: "There is already a friend request"
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

    # YOUR FRIEND REQUESTS PENDING YOU REQUEST
    @pending_friend_request = Friendship.all.where(requester_id: @user.id, status: "pending")

    # YOUR FRIEND REQUESTS PENDING YOU RECEIVE
    @pending_friends_receive = Friendship.all.where(receiver_id: @user.id, status: "pending")

    # ALL PENDING FRIENDS
    @pending_friends = @pending_friend_request + @pending_friends_receive
  end
end
