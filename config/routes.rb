Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'home', to: 'users#home'

  get 'signup', to: 'users#signup'

  post "/signup", to: 'users#new_sign_up'
 
  #get '/auth/:provider/callback', to: 'sessions#create'

  get 'login', to: 'users#login'

  post '/sessions', to: 'sessions#create'

  get "/show", to: 'users#show'

  get '/logout', to: 'users#logout'
end
