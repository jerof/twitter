Rails.application.routes.draw do
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get 'help', to: 'static_pages#help'
  get '/privacy', to: 'static_pages#privacy'
  resources :tweets
end
