Rails.application.routes.draw do
  get 'static_pages/about'

  root 'posts#index'  

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :posts, only: [:new, :create, :index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
