class FriendshipsController < ApplicationController
  before_action :get_user
  def get_user
    @username = current_user.username
    @user_now = RSpotify::User.find(current_user.uid)
    @full_name = @user_now.display_name
    @all_playlists = @user_now.playlists
    @prof_pic_url = @user_now.images[0]["url"]
  end

  def index
    @user = current_user
    @friendship = Friendship.new

    @friends = Friendship.all.where(status: "accepted").where(requester_id: @user.id).or(Friendship.all.where(status: "accepted").where(receiver_id: @user.id))

    @pending_friends = Friendship.all.where(status: "pending").where(receiver_id: @user.id)

    # @potential_friends = User.all
    # search friendships find users that are not current_user, get id
    @potential_friends = []
    Friendship.all.where.not(requester_id: @user.id).or(Friendship.all.where.not(receiver_id: @user.id)).each do |friendship|
      @potential_friends << User.find(friendship.receiver_id) if friendship.receiver_id != @user.id
      @potential_friends << User.find(friendship.requester_id) if friendship.requester_id != @user.id
    end

  end

end
