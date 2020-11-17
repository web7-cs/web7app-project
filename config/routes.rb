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
<<<<<<< HEAD
  get '/about-us', to: 'basics#about_us'
=======
<<<<<<< Updated upstream
=======
  get '/about-us', to: 'basics#about_us'
    get '/homepage', to: 'basics#homepage'
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
>>>>>>> 1448a4b40327bd3b935c820e057a56b76a2ce31a
  get 'divisor/new', to: 'divisor#new'
  get '/scrape', to: 'scrape#index'
  post '/divisor/evaluate', to: 'divisor#evaluate'

  resources :ps3
  
  root to: 'basics#index'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end