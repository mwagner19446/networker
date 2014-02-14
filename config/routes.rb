NetworkerApp::Application.routes.draw do
  resources :users do 
    resources :tasks
    resources :connections do 
      resources :liusers
    end 
  end 
end
