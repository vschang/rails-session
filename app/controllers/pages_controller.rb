class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home

  end

  def profile
    @user_now = RSpotify::User.find(current_user.uid)
    @full_name = @user_now.display_name
    @all_playlists = @user_now.playlists
    @prof_pic_url = @user_now.images[0]["url"]
  end

  def landing_page
  end
end
