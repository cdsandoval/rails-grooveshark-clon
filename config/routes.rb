Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: "home#index"

  namespace :api do
    resources :artists, only: [ :index, :show] do
      member do
        get :songs
        get :albums
      end
      get "/search" => :search, on: :collection
    end

    resources :songs, only: [ :index, :show] do
      member do
        get :artists
        get :albums

        put "/progress" => :song_progress
        put "/rating" => :song_rating
      end
      get "/search" => :search, on: :collection
    end

    resources :albums, only: [ :index, :show] do
      member do
        get :songs
        get :artists

        put "/rating" => :album_rating
      end
      get "/search" => :search, on: :collection
    end
  end

  namespace :admin do
    resources :songs do
      get "/new" => :new, on: :collection
      get "/edit" => :edit, on: :member
    end

    resources :artists do
      get "/new" => :new, on: :collection
      get "/edit" => :edit, on: :member
    end

    resources :albums do
      get "/new" => :new, on: :collection
      get "/edit" => :edit, on: :member
    end
  end

end
