Rails.application.routes.draw do
  devise_for :users
  get 'recipes/index', to: 'recipes#index'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root "recipes#public"



  resources :users do
    resources :recipes
  end

end
