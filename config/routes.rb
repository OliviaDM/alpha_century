Rails.application.routes.draw do
  get 'coordinates/new'
  post 'coordinates/create'
  get 'coordinates/update'
  post 'coordinates/destroy'
  post 'coordinates/index'
  post 'timelinks/create'
  post 'timelinks/destroy'
  get 'coordinates/error404pls'
  resources :worlds do
    resources :tags, only: [:create, :update]
    resources :cards do
      resources :taggings, only: [:create, :destroy]
    end
    resources :maps
    resources :timelines, only: [:index]
  end

  devise_for :users
  root to: 'pages#home'
  get 'profile', to: 'pages#profile'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
