class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def spotify
    user = User.find_for_oauth(request.env['omniauth.auth'])

    spotify_user = RSpotify::User.new(request.env['omniauth.auth'])

    # Get user's top played artists and tracks
    @top_artists = spotify_user.top_artists #=> (Artist array)
    @top_tracks = spotify_user.top_tracks(time_range: 'short_term') #=> (Track array)


    if user.persisted?
      sign_in_and_redirect user, event: :authentication
      set_flash_message(:notice, :success, kind: 'Spotify') if is_navigational_format?
    else
      session['devise.spotify_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
    # binding.pry
  end
end
