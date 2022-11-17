Rails.application.routes.draw do
  devise_for :users
  get 'recipes/index', to: 'recipes#public'
  root "recipes#index"
  # resources :recipe_foods
  # resources :recipes, except: :update
  # resources :foods, except: :update
  # resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Defines the root path route ("/")
  # root "articles#index"
  # root 'pages#index'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

end
