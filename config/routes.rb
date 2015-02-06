Rails.application.routes.draw do
  
  root 'slides#index'
  resources :slides

end
