Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about', to: 'pages#about' 
  resources :articles #provides routes for CRUD operations
  get 'signup', to: 'users#new' #get 'route' direct to controll#method
  #post 'users', to: 'users#create' #one way to post request for users gets sent to users controller create method
  resources :users, except: [:new] #will generate all routes for users except new user
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :categories, except: [:destroy] #provide all restful routes for categories(except destroy)
end
