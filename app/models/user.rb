class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # has_one_attached :prof_pic
  has_many :posts
  has_many :reposts
  validates :first_name, :last_name, :username, presence: true
  validates :username, uniqueness: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
