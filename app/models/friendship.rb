class Friendship < ApplicationRecord
  belongs_to :requester, class: 'User', foreign_key: :requester_id, primary_key: :id
  belongs_to :receiver, class: 'User', foreign_key: :receiver_id, primary_key: :id
  
end
