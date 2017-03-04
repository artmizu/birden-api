Rails.application.routes.draw do
  resources :genres
  
  resources :animes do
    collection do
      get 'nokogiri'
      get 'factory'
      get 'video_preview'
    end
  end
  post 'scores' => 'anime/scores#create'
  patch 'scores' => 'anime/scores#update'

  resources :series
  resources :subscriptions

  post 'user_token' => 'user_token#create'
  resources :users 
  get 'user_notifications' => 'users/notifications#index'
  patch 'user_notifications/:id' => 'users/notifications#update'

  mount ActionCable.server => '/cable'
  mount Knock::Engine => "/knock"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end