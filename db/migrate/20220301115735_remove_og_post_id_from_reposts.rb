class RemoveOgPostIdFromReposts < ActiveRecord::Migration[6.1]
  def change
    remove_column :reposts, :og_post_id
  end
end
