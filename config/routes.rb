Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :ingredients
  resources :recipes
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :units
  resources :ingredient_names

end
