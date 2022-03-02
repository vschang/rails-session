class RemoveSpotifyUrl < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :spotify_url
  end
end
