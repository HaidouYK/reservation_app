Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'top#index'

  resources :users, only: [:update] 
  get 'users/account'
  get 'users/profile'

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: 'users/registrations'
  }

  resources :rooms do
    collection do
      get 'search_area'
      get 'search_keyword'
      get 'posts'
    end
  end

  resources :reservations
end
