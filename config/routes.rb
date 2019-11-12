Rails.application.routes.draw do
  resources :worlds do
    resources :tags, only: [:create, :update]
    resources :cards do
      resources :taggings, only: [:create, :destroy]
    end
    resources :maps
  end

  get 'timelines/index'
  devise_for :users
  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
