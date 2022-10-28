class AddFirstUsertoChatrooms < ActiveRecord::Migration[6.1]
  def change
    add_reference :chatrooms, :first_user, index: true
  end
end
