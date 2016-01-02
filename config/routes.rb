Rails.application.routes.draw do
  
  resources :reviews
  resources :places
  get 'sessions/new'

  get 'static_pages/index'

  resources :users
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  root 'static_pages#index'

  # Catch all invalid routes
  match '*path' => 'your_controller#your_action'
end
