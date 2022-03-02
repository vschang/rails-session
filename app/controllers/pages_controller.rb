class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :get_user, except: :home

  def home
    # @user_now = RSpotify::User.find(current_user.uid)
    # top = @user_now.top_artists
    # title of first playlist - playlist_titles = @present_user.playlists.first.name
    # track_uid = @me.playlists.first.tracks.first.uri.split(':').last
    # @track = RSpotify::Track.find(track_uid)

  end

  def profile
  end

  def landing_page
  end

  def get_user
    if user_signed_in?
      @user_now = RSpotify::User.find(current_user.uid)
      # @user_now = RSpotify::User.new(request.env['omniauth.auth'])
      @username = current_user.username
      if @user_now != nil
        @full_name = @user_now.display_name
        @all_playlists = @user_now.playlists
        @prof_pic_url = @user_now.images[0]["url"]
      end
    end
  end
end
