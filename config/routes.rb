Rails.application.routes.draw do

  devise_for :users
  get '/sql', to: 'sqlsolution#index'
  resources :posts
  resources :divisor
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
  get '/ps6', to: 'basics#ps6'

  get '/about-us', to: 'basics#about_us'
  get '/homepage', to: 'basics#homepage'

  get 'divisor/new', to: 'divisor#new'
  get '/scrape', to: 'scrape#index'
  post '/divisor/evaluate', to: 'divisor#evaluate'
  match 'download', to: 'home#ps4', as: 'download', via: :get
  resources :ps3
  
  root to: 'basics#index'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end