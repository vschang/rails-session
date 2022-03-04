class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :get_user

  def home
  end

  def profile
  end

  def destroy_sesh
    sign_out_and_redirect(current_user)
  end

  def landing_page
  end

  def get_user
    if user_signed_in?
    @user_now = RSpotify::User.find(current_user.uid)
      @username = current_user.username
      if @user_now != nil
        @full_name = @user_now.display_name
        @all_playlists = @user_now.playlists
        @prof_pic_url = @user_now.images[0]["url"]
      end
    end
  end
end
