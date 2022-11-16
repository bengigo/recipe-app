Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root 'pages#index'
  root "recipes#index"
  resources :recipe_foods
  resources :recipes, except: :update
  resources :foods, except: :update
  resources :users
end
