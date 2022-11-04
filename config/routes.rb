Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :user, only: [:show] do
    resources :friendships, only: [:create]
  end
  get '/user/:id/friendship_index', to: 'user#friendship_index'
  resources :posts do
    resources :post_comments, only: [:new, :create, :destroy]
    resources :reposts, only: [:create]
    resources :post_likes, only: [:create]
  end

  resources :reposts, only: [:create, :destroy, :show] do
    resources :repost_comments, only: [:new, :create]
    resources :repost_likes, only: [:create]
  end

  resources :repost_comments, only: [:destroy]
  resources :friendships, only: [:destroy, :index]
  resources :post_likes, only: [:destory]
  resources :repost_likes, only: [:destory]

  resources :chatrooms do
    resources :messages, only: [:create]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'profile', to: 'pages#profile'

  patch '/friendships/:id/accept', to: 'friendships#accept', as: :accept_friendship
  patch '/friendships/:id/reject', to: 'friendships#reject', as: :reject_friendship

  get 'sign_out', to: 'pages#destroy_sesh'
  get 'search', to: 'pages#search'
  post "/user/:id/follow", to: "friendships#follow", as: :follow_user
end
