class AddArtistToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :artist, :string
  end
end
