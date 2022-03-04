class Post < ApplicationRecord
  belongs_to :user
  has_many :reposts, dependent: :destroy
  validates :title, :content, presence: true
  validates :music,  :content, presence: true

  def reposted?
    reposts.where(post_id: @post_id).exists?
  end
end
