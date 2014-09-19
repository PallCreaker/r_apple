Rails.application.routes.draw do
  patch 'registration/update'
  get 'registration/index'
  get 'quiz/index'
  get "quiz/selection"
  get "quiz/complete"
	get "matchinglist/index"
	get "matchinglist/create"
  devise_for :users, :controllers => {
    :sessions           =>  "users/sessions",
    :registrations      =>  "users/registrations",
    :passwords          =>  "users/passwords",
    :omniauth_callbacks =>  "users/omniauth_callbacks"
  }
end
