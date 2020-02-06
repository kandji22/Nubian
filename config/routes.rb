# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'
  scope '/:locale' do
    resources :users
    resources :sessions, only: %i[new create destroy]
    resources :artists do
      resources :comments, only: [:create]
    end
    resources :songs
    resources :albums
    resources :agendas
    scope '/dashboards' do
      get 'admin/artists'
      get 'admin/sounds'
      get 'admin/albums'
      get 'admin/users'
      get 'admin/agendas'
      scope ':ie' do
        get 'admin/showartist'
        get 'admin/showsong'
        get 'admin/showalbum'
        get 'admin/showuser'
      end
    end
  end
end
