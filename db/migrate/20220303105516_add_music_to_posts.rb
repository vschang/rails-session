class AddMusicToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :music, :string
  end
end
