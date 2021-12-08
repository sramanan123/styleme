Rails.application.routes.draw do
  resources :bookmarks
  resources :image_comments
  resources :upload_images
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
