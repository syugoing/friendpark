Rails.application.routes.draw do

  get 'relationships/create'

  get 'relationships/destroy'

  root 'topics#index'
  resources :topics
  resources :comments, only: [:create]

  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :users, only: [:index]
  resources :relationships, only: [:create, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
