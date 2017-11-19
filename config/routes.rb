# frozen_string_literal: true

Rails.application.routes.draw do
  root 'rentals#index'

  resources :rentals, except: %i[new create destroy] do
  	resources :rental_details, only: [:index]
  end
end
