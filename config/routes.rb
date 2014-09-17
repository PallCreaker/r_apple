Rails.application.routes.draw do
  #get 'users/new', to: 'users#new', as: 'user_root'
  #get 'users/create'
  #get 'users/index'
  #root :to => 'users#index'
  get 'registration/edit', to: 'registration#edit', as: 'user_root'
  get 'registration/update'
  get 'registration/index'
  root :to => 'registration#index'
  resources(:user)
  devise_for :users, :controllers => {
    :sessions           =>  "users/sessions",
    :registrations      =>  "users/registrations",
    :passwords          =>  "users/passwords",
    :omniauth_callbacks =>  "users/omniauth_callbacks"
  }
end
