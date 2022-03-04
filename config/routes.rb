Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :animals
    resources :adoptions, only: [:create, :new, :show]
end
