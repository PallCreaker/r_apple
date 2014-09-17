Rails.application.routes.draw do
  get 'quiz/index'
  get "quiz/selection"
  get "quiz/complete"
  devise_for :users, :controllers => {
    :sessions           =>  "users/sessions",
    :registrations      =>  "users/registrations",
    :passwords          =>  "users/passwords",
    :omniauth_callbacks =>  "users/omniauth_callbacks"
  }
  get 'login/index'
  root:to => "login#index"  
end
