Rails.application.routes.draw do
  devise_for :users
  root 'homes#index'


  resources :books, only: %i[update new index create index show destroy edit] do
  end
  resources :users  , only: %i[new index show edit update]
  get 'home/about' => 'homes#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
