class Friendship < ApplicationRecord
  belongs_to :requester, class_name: 'User', foreign_key: :requester_id, primary_key: :id
  belongs_to :receiver, class_name: 'User', foreign_key: :receiver_id, primary_key: :id
  validates :status, inclusion: { in: %w(accepted pending rejected) }
  validates :receiver_id, presence: true
  # validates :receiver_id, uniqueness: true

  # validates :requester_id, uniqueness: true
  validates :requester_id, presence: true

  validates :receiver_id, uniqueness: { scope: :requester_id,
    message: "No more requests can be made between you two" }

  validate :cannot_friend_self

  def cannot_friend_self
    if requester_id == receiver_id
      errors.add(:receiver_id, "You can't friend yourself")
    end
  end
end
