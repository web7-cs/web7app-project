Rails.application.routes.draw do
  get 'basics/index'
  get 'home/index'
  get 'divisor/new', to: 'divisor#new'
  resources :divisor
  get 'scrape/index', to: 'scrape#index'
  post '/divisor/evaluate', to: 'divisor#evaluate'
  root to: 'home#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
