Rails.application.routes.draw do

  #root
  root to:'home#index'

  # Api 1.0  
  namespace :api1 do
    # users
    get '/users', to: 'users#index'   
    post '/users/login', to: 'users#login'   
    # locations
    get '/locations/get_all_closer_to_user', to: 'locations#get_all_closer_to_user'   
    get '/locations/set_location_user', to: 'locations#set_location_user'   
  end   

  # Admin panel 
  namespace :admin do
    root to:'users#index'
    # users
    get '/users', to: 'users#index'   
    delete '/users', to: 'users#delete'   
    get  '/users/login', to: 'users#login'   
    post '/users/login', to: 'users#do_login'   
    # users
    get  '/products', to: 'products#index'   
    get  '/products/add', to: 'products#new'   
    post '/products/add', to: 'products#add'   
  end   

end