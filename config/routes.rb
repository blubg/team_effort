Rails.application.routes.draw do
  get '/' => 'home#index', as: :root
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  get '/signup' => 'users#new'
  resources :users, except: [:new]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

end
