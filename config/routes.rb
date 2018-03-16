Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#index'

  get :signin, to: 'sessions#new', as: :signin
  resources :sessions, only: :create
  delete :signout, to: 'session#destroy', as: :signout

  get :signup, to: 'user#new', as: :signup
  resources :users, only: :create

  resources :projects

  resources :projects_users, only: %i[create destroy]
end
