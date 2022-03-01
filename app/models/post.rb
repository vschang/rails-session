class Post < ApplicationRecord
  belongs_to :user
  has_many :reposts
  validates :title, :content, presence: true
end
