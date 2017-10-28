Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :show, :create]
  resource :session, only: [:create, :new, :destroy]
  resources :albums, only: [:new, :create, :edit, :destroy, :show]
  resources :tracks, only: [:show, :create, :destroy, :edit, :new]
  resources :bands
end
