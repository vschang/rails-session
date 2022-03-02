class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @me = RSpotify::User.find(current_user.uid)
    track_uid = @me.playlists.first.tracks.first.uri.split(':').last
    @track = RSpotify::Track.find(track_uid)
  end
end
