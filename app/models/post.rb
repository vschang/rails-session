class Post < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :reposts
  validates :title, :content, presence: true
end
