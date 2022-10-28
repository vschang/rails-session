class AddSecondUsertoChatrooms < ActiveRecord::Migration[6.1]
  def change
    add_reference :chatrooms, :second_user, index: true
  end
end
