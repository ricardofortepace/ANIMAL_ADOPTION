Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :animals do
    resources :adoptions, only: %i[create new]
  end
  resources :adoptions, only: [:show]
end
