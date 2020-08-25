Rails.application.routes.draw do
  get 'home', to: 'home#index'

  resources :memos, only: [:index]
end
