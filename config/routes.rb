Rails.application.routes.draw do

  root 'rentals#index'
  
  resources :rentals, except: [:destroy]

end
