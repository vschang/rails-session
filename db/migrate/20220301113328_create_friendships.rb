class CreateFriendships < ActiveRecord::Migration[6.1]
  def change
    create_table :friendships do |t|
      t.integer :requester_id
      t.integer :receiver_id

      t.timestamps
    end
  end
end
