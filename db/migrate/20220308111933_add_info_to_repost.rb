class AddInfoToRepost < ActiveRecord::Migration[6.1]
  def change
    add_column :reposts, :music, :string
    add_column :reposts, :image, :string
    add_column :reposts, :url, :string
    add_column :reposts, :artist, :string
  end
end
