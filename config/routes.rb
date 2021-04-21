Rails.application.routes.draw do
  devise_for :users
  # , controllers: {
  #   registrations: 'users/registrations'
  # }

  # devise_scope :user do
  #   get 'introductions', to: 'users/registrations#new_introduction'
  #   post 'introductions', to: 'users/registrations#create_introduction'
  # end

  # devise_scope :user do
  #   get 'introductions', to: 'users/registrations#new_introduction'
  #   post 'introductions', to: 'users/registrations#create_introduction'
  # end

  root to: "questions#index"
  resources :questions do
    resources :likes, only: [:create, :destroy]
    resources :answers, only: [:new, :create] do
      resources :bests, only: :create  
    end
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
end
    
