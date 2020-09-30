Rails.application.routes.draw do
  get 'basics/index'
  get 'home/index'
  get 'webscrapper/index'
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
