class RepostComment < ApplicationRecord
  belongs_to :repost
  belongs_to :user
  validates :content, presence: true
end
