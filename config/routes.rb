Rails.application.routes.draw do
  get 'timelines/index'
  devise_for :users
  root to: 'pages#home'
  resources :tags, only: [:create, :update]
  resources :cards do
    member do
      resources :text_fields, only: [:create, :update]
      resources :image_fields, only: [:create, :update]
      resources :link_fields, only: [:create, :update]
    end
  end
  resources :maps
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
