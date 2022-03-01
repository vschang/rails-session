class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @user_now = RSpotify::User.find(current_user.uid)
    # title of first playlist - playlist_titles = @present_user.playlists.first.name

    # track_uid = @me.playlists.first.tracks.first.uri.split(':').last
    # @track = RSpotify::Track.find(track_uid)
    raise
  end

  def profile
    @user_now = RSpotify::User.find(current_user.uid)
    @display_name = @user_now.display_name
  end
end
