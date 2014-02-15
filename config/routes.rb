NetworkerApp::Application.routes.draw do
  resources :users do 
    resources :tasks
    resources :connections do 
      resources :liusers
    end 
  end 

  root "welcome#index"
  get "/users/:id/lilist", to: "liusers#list"
  get "/users/:id/meetuplist", to: "meetup#list"
  post "/users/:id/meetuplist", to: "meetup#list"
  get "/sessions", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  delete "/sessions", to: "sessions#destroy"
  

end
