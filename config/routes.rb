Rails.application.routes.draw do
  root 'welcome#index'

  get '/login' => 'sessions#new'
  get 'sessions/new'
  get 'welcome/index'
  post   '/login'  => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :account_activations, only: [:edit]
  resources :questions, :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
