Rails.application.routes.draw do

<<<<<<< HEAD
=======
  get 'sqlsolution/index'
  resources :posts
>>>>>>> f43ca1b3958567ad1b0fec7d0e3e88641938fc91
  post '/erase_personalization', to: 'quotations#index'
  get '/erase_personalization', to: 'quotations#index'
  get 'quotations/delete', to: 'quotations#destroy'
  post '/search', to: 'quotations#search'
  get '/search', to: 'quotations#index'
  get '/sort', to: 'quotations#sort'
  get '/sort/:sort_name', to: 'quotations#sort'
  resources :quotations

  get 'basics/index'
  get 'home/index'
  get 'divisor/new', to: 'divisor#new'

  resources :divisor
  get 'scrape/index', to: 'scrape#index'
  post '/divisor/evaluate', to: 'divisor#evaluate'
<<<<<<< HEAD
=======

  resources :ps3
>>>>>>> f43ca1b3958567ad1b0fec7d0e3e88641938fc91
  

  root to: 'home#index'
  # root to: 'quotations#index'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end