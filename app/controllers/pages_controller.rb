class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    # @user_now = RSpotify::User.find(current_user.uid)
    # title of first playlist - playlist_titles = @present_user.playlists.first.name
    # track_uid = @me.playlists.first.tracks.first.uri.split(':').last
    # @track = RSpotify::Track.find(track_uid)
    if current_user != nil
      @user_now = RSpotify::User.find(current_user.uid)
      @username = current_user.username
      if @user_now != nil
        @full_name = @user_now.display_name
        @all_playlists = @user_now.playlists
        @prof_pic_url = @user_now.images[0]["url"]
      end
    end
  end

  def profile
    @username = current_user.username
    @user_now = RSpotify::User.find(current_user.uid)
    @full_name = @user_now.display_name
    @all_playlists = @user_now.playlists
    @prof_pic_url = @user_now.images[0]["url"]
  end

  def landing_page
  end
end
