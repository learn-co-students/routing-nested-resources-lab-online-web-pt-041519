Rails.application.routes.draw do
  resources :artists  do
    resources :songs, only: [:index, :show]
  end
#only index & show
  resources :songs

end
