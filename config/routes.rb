Rails.application.routes.draw do
  devise_for :users
  get 'recipes/index', to: 'recipes#public'
  root "recipes#index"
  # resources :recipe_foods
  # resources :recipes, except: :update
  # resources :foods, except: :update
  # resources :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

end
