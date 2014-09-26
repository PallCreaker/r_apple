Rails.application.routes.draw do
  get 'messages/:id', to: 'messages#proclamation' #id = competition.id not message.id
  get 'messages', to: 'messages#index'
  post 'messages/:id', to: 'messages#reply' #id = competition.id not message.id
  resource :messages, only: [:new, :create]

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
