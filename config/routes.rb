Rails.application.routes.draw do
  get 'coordinates/new'
  post 'coordinates/create'
  get 'coordinates/update'
  post 'coordinates/destroy'
  post 'coordinates/index'
  post 'timelinks/create'
  post 'timelinks/destroy'
  get '/user', to: "worlds#index", :as => :user_root


  resources :worlds do
    resources :tags, only: [:create, :update]
    resources :cards do
      resources :taggings, only: [:create, :destroy]
    end
    resources :maps
    resources :timelines, only: [:index]
  end

  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'
  get 'profile', to: 'pages#profile'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
