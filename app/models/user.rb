class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # has_one_attached :prof_pic
  has_many :posts, dependent: :destroy
  has_many :reposts, dependent: :destroy
  # validates :first_name, :last_name, :username, presence: true
  # validates :username, uniqueness: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:spotify]

  include PgSearch::Model
    pg_search_scope :search_by_name_and_username,
    against: [ :first_name, :last_name, :username ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  def friends
    @friends = Friendship.all.where(status: "accepted").where(requester_id: self.id).or(Friendship.all.where(status: "accepted").where(receiver_id: self.id))
    @self_friendship = Friendship.where(status: "accepted").where(requester_id: self.id).where(receiver_id: self.id)
    @friends = @friends.select { |friendship| friendship.requester != self || friendship.receiver != self }.map do |friendship|
      requester = friendship.requester
      receiver = friendship.receiver
      if self == requester
        receiver
      elsif self == receiver
        requester
      end
    end
  end

  def not_friends
    User.all - friends - [self]
  end

  def self.find_for_oauth(auth)
    # Create the user params
    user_params = auth.slice("provider", "uid")
    user_params.merge! auth.info.slice("email", "first_name", "last_name")
    user_params[:prof_pic] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h
    # Finish creating the user params

    # Find the user if there was a log in
    user = User.find_by(provider: auth.provider, uid: auth.uid)

    # If the User did a regular sign up in the past, find it
    user ||= User.find_by(email: auth.info.email)
    # If we had a user, update it
    if user
      user.update(user_params)
    # Else, create a new user with the params that come from the app callback
    else
      user = User.new(user_params)
      # create a fake password for validation
      user.password = Devise.friendly_token[0, 20]
      user.save
    end
    # binding.pry
    return user
  end


end
