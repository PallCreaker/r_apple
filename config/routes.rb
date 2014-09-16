Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  get 'login/new', to: 'login#new', as: 'user_root'
  get 'login/index'
  root :to => 'login#index'
  devise_for :users, :controllers => {
    :sessions           =>  "users/sessions",
    :registrations      =>  "users/registrations",
    :passwords          =>  "users/passwords",
    :omniauth_callbacks =>  "users/omniauth_callbacks"
  }
end
