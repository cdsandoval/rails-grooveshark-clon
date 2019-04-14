Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :albums
    resources :artists do
      member do
        get :songs
        get :albums
      end
      
      collection do
      get :search
      end

    end

    resources :songs, only: [ :index, :show] do
      member do
        get :artists
        get :albums

        put "/progress" => :song_progress
        put "/rating" => :song_rating 
      end
    end

    resources :albums, only: [ :index, :show] do
      member do
        get :songs
        get :artists

        put "/rating" => :album_rating
        
      end
    end

  end


end
