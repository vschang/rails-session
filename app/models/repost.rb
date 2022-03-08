class Repost < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :repost_comments, dependent: :destroy
  has_many :repost_likes, dependent: :destroy
end
