class UserController < ApplicationController
  def show
    @user = User.find(params[:id])
    @current_user = current_user
    @user_id_arr = []
    @user_id = @user.id
    @user_id_arr << @user_id

    @friendship = Friendship.new

    if Friendship.where(requester: current_user, receiver: @user, status: 'accepted').empty?
      @user_friendship = Friendship.where(receiver: current_user, requester: @user, status: 'accepted').first
    else
      @user_friendship = Friendship.where(requester: current_user, receiver: @user, status: 'accepted').first
    end
    @user_posts = Post.where(user_id: @user_id)
    @user_reposts = Repost.where(user_id: @user_id)

    @profile_posts = @user_posts + @user_reposts
    @profile_posts = @profile_posts.sort_by{ |posts| posts.created_at }.reverse

    @post_time = []
    time_now = Time.now
    @profile_posts.each do |post|
      time_diff = time_now - post.created_at
      if time_diff < 60.0
        @post_time << "now"
      elsif time_diff < 3600.0
        @post_time << "#{(time_diff/1.minute).to_i.round}m"
      elsif time_diff > 3600.0 && time_diff < 86400.0
        @post_time << "#{(time_diff/1.hour).to_i.round}h"
      elsif time_diff > 86400.0 && time_diff < 604800.0
        @post_time << "#{(time_diff / 1.day).to_i.round}d"
      else
        @post_time << "#{(time_diff / 1.week).to_i.round}w"
      end
    end
  end

  def friendship_index
    @user = User.find(params[:id])
    @friendship = Friendship.new

    # # friends are those whose status is accepted and the requester is current user or all friends where the status is accepted and the receiver is current user
    @friends = Friendship.all.where(status: "accepted").where(requester_id: @user.id).or(Friendship.all.where(status: "accepted").where(receiver_id: @user.id))
    # @friends2 = Friendship.all.where(status: "accepted")
    @following = Friendship.all.where(requester_id: @user.id)
    @followers = Friendship.all.where(receiver_id: @user.id)
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

  def user_params
    params.require(:user).permit(:user_id)
  end
end
