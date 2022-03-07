class CreateRepostComments < ActiveRecord::Migration[6.1]
  def change
    create_table :repost_comments do |t|
      t.string :content
      t.references :repost, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end