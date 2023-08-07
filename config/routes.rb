Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'new', to: 'pages#new', as: 'new'
  post 'score', to: 'pages#score', as: 'score'
end
