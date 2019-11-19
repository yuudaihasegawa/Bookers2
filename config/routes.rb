Rails.application.routes.draw do
  devise_for :users
  root to: 'home#top'
  get 'home/about' => 'home#about'
  root 'user/id#show'
  resources :users, only:[:show,:index,:edit,:update]
  resources :books

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
