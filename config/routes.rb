NetworkerApp::Application.routes.draw do
  resources :users do
    resources :tasks, :tokens 
    resources :connections do 
      resources :liusers
    end 
  end 

  root "welcome#index"
  get "about", to: "welcome#about"
  post "/liusers", to: "liusers#create"
  post "/liusers/connections", to: "liusers#connections"
  get "/users/:id/lilist", to: "liusers#list"
  get "/users/:id/meetupgroup", to: "meetup#group"
  post "/users/:id/meetupgroup", to: "meetup#group"
  get "/users/:id/upcomingmeetup", to: "meetup#upcoming"
  post "/users/:id/upcomingmeetup", to: "meetup#upcoming"

  get "/sessions", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  post "/sessions/superuser", to: "sessions#superuser"
  delete "/sessions", to: "sessions#destroy"
  

end
