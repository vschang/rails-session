class CreateRepostLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :repost_likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :repost, null: false, foreign_key: true

      t.timestamps
    end
  end
end
