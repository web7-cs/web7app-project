Rails.application.routes.draw do

  get '/sql', to: 'sqlsolution#index'
  resources :posts
  post '/erase_personalization', to: 'quotations#index'
  get '/erase_personalization', to: 'quotations#index'
  get 'quotations/delete', to: 'quotations#destroy'
  post '/search', to: 'quotations#search'
  get '/search', to: 'quotations#index'
  get '/sort', to: 'quotations#sort'
  get '/sort/:sort_name', to: 'quotations#sort'
  resources :quotations

  get '/', to: 'basics#index'
  get '/ps4', to: 'basics#ps4'
  get '/ps5', to: 'basics#ps5'
  get 'divisor/new', to: 'divisor#new'

  resources :divisor
  get 'scrape/index', to: 'scrape#index'
  post '/divisor/evaluate', to: 'divisor#evaluate'

  resources :ps3
  
  root to: 'basics#index'
  # root to: 'quotations#index'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end