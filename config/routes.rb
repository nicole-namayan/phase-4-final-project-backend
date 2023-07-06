Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

   resources :books, only: [:index, :show, :create, :update, :destroy]
   resources :user_books, only: [:create]
   resources :notes, only: [:create]
   resources :users, only: [:index, :update, :destroy]
   resources :orders, only: [:index, :show, :create, :update, :destroy]
   resources :categories, only: [:index, :show, :create, :update, :destroy]

  #  namespace :api do
    # resources :users, only: [:index, :destroy, :update]
    post "/signup", to: "users#create"
    get "/me", to: "users#show"
    post "/login", to: "sessions#create"
    post "/register", to: "sessions#authenticate"
    delete "/logout", to: "sessions#destroy"
    patch '/reset_password', to: 'users#reset_password'
    # patch "/bookclubs/:id/current-book", to: "bookclubs#current_book"

    # resources :books, only: [:show, :create, :destroy]
    
  
    
    
  # end
  # get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }

end
