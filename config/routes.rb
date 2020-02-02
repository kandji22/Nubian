# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'
  resources :users
  resources :sessions, only: %i[new create destroy]
  resources :artists
  resources :songs
  resources :albums
  resources :agendas
  scope '/dashboards' do
    get 'admin/artists'
    get 'admin/sounds'
    get 'admin/albums'
    get 'admin/users'
  end
end
