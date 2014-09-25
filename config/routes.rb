Rails.application.routes.draw do
  resources :messages

  patch "registration/update"
  get "registration/index"
  get "quiz/index"
  get "quiz/selection"
  get "quiz/complete"
  get "matchinglist/index"
  get "matchinglist/create"
  get "home/index"
  get "home/show"
  root :to => "home#index"
  devise_for :users, controllers: {
    sessions:           "users/sessions",
    registrations:      "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
end
