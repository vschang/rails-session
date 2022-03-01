class AddPostIdToRepost < ActiveRecord::Migration[6.1]
  def change
    add_column :reposts, :og_post_id, :integer
  end
end
