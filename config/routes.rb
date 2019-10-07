Rails.application.routes.draw do
  resources :artists do
    resources :songs, only: [:show, :index]
  end
  resources :songs do
    resources :artists, only: [:show, :index]
  end


end
