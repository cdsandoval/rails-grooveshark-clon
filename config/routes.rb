Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :albums
    resources :artists do
      # resources :songs, only: [:artist_show]
      get 'artist_show', on: :member
    end
    resources :songs


    
  end



end
