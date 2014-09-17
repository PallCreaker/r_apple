Rails.application.routes.draw do
  get 'registration/edit', to: 'registration#edit', as: 'user_root'
  patch 'registration/update'
  get 'registration/index'
  root :to => 'registration#index'
  #resource(:user)
  devise_for :users, :controllers => {
    :sessions           =>  "users/sessions",
    :registrations      =>  "users/registrations",
    :passwords          =>  "users/passwords",
    :omniauth_callbacks =>  "users/omniauth_callbacks"
  }
end
