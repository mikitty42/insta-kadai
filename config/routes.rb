Rails.application.routes.draw do
  root to: 'users#new'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resources :favorites,only: [:create,:destroy,:index]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:index,:new,:create,:show,:edit,:update]
  resources :pictures do
    collection do
      post :confirm
    end
  end
end
