# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'

  post '/users/login', to: 'sessions#login'
  resources :events, only: %i[index show create update]
  resources :participations, only: %i[create destroy]

  get 'users/profile', to: 'users#profile'
end
