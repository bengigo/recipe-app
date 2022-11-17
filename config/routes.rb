Rails.application.routes.draw do
  devise_for :users
  get 'recipes/index', to: 'recipes#public'
  root "recipes#index"

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users do
    resources :recipes
  end

end
