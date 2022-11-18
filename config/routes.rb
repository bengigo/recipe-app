Rails.application.routes.draw do
  devise_for :users
  get 'recipes/index', to: 'recipes#index'
  get 'recipes/public', to: 'recipes#public'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root "recipes#public"
  resources :foods, except: :update
  resources :users do
    resources :recipes, except: :update do
      resources :recipe_foods
    end

  end
  

  get "/general_shopping_list", to: "general_shopping_list#index"

end
