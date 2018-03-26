Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  get :settings, controller: :home, action: :settings
  resources :profile, only: [:edit, :update] do
    collection do
      get :change_password
      post :update_password
    end
  end

  root to: 'home#index'
end
