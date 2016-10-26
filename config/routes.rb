Rails.application.routes.draw do
  resources :admins, only: [:new, :create]
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
  resources :volunteers
  resources :posts do
    resources :comments
  end
  get '/resources' => 'home#resources', as: :resources
  get '/faq' => 'home#show', as: :faq
  root "home#index"
  #this is a comment
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
