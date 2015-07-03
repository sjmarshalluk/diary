Rails.application.routes.draw do
  
  get 'sessions/new'

  get 'users/new'

  resource :session
  resources :entries, except: [:new, :create]
  resources :users do
  	resources :entries, only: [:new, :create]
  end

  root "entries#index"

end
