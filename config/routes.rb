Rails.application.routes.draw do

  #root
  root to:'home#index'

  #
  # Api 1.0  
  namespace :api1 do
    # users
    get '/users', to: 'users#index'   
    post '/users/login', to: 'users#login'   
    # locations
    get '/locations', to: 'locations#index'   
  end   

end