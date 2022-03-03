Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :posts do
    resources :reposts, only: [:create, :destroy, :show]
  end
  resources :friendships, only: [:create, :destroy, :index]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'profile', to: 'pages#profile'
  get 'landing_page', to: 'pages#landing_page'
  patch '/friendships/:id', to: 'friendships#accept', as: :accept_friendship
  patch '/friendships/:id', to: 'friendships#reject', as: :reject_friendship
end
