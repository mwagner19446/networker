NetworkerApp::Application.routes.draw do
  resources :users do

    resources :events, only: [:index] do
      post 'search', :on => :collection
      get 'search', :on => :collection
    end

    resources :groups, only: [:index] do 
      post 'search', :on => :collection
    end 

    resources :liusers, only: [:index] do 
      post 'search', :on => :collection
      get 'search', :on => :collection
    end


    resources :tasks, :tokens, :connections 
  end 

  root "welcome#index"
  get "about", to: "welcome#about"
  
  get "/users/:id/lilist", to: "liusers#list"
  post "/liusers", to: "liusers#create"

  get "/sessions", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  post "/sessions/superuser", to: "sessions#superuser"
  delete "/sessions", to: "sessions#destroy"
  

end
