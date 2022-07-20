Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'top#index'

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  devise_scope :user do
    patch 'users/edit', :to => 'users/registrations#update'
  end

  get 'users/account'
  get 'users/profile'
  patch 'users/profile', :to => 'users#update'

  resources :rooms do
    collection do
      get 'search_area'
      get 'search_keyword'
      get 'posts'
    end
  end

  resources :reservations 
  post 'reservations/new'
  
end
