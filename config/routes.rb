Rails.application.routes.draw do
  resources :bookmarks
  resources :topics
  devise_for :users
  get 'welcome/index'

  get 'welcome/about'
  
  root to: 'welcome#index'

end
