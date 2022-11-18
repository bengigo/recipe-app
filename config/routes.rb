Rails.application.routes.draw do
  devise_for :users
  get 'recipes/index', to: 'recipes#index'
  get 'recipes/public', to: 'recipes#public'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  

  root "recipes#public"

  resources :users do 
     resources :foods 
     resources :recipes
  end

end

