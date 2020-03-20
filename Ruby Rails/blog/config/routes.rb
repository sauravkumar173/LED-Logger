Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Show post list
  get '/posts', to: 'posts#index', as: 'posts'

  # Creates new posts and adds to database
  get '/posts/new', to: 'posts#new', as: 'new_post'
  post '/posts', to: 'posts#create', as: 'create_post'
  
  # Read existing posts and shows contents
  get '/posts/:id', to: 'posts#show', as: 'post'


  # Edits existing posts with new title and contents
  get '/posts/:id/edit', to: 'posts#edit', as: 'edit_post'

  # Updates data base with editted post
  patch '/posts/:id', to: 'posts#update'
  put '/posts/:id', to: 'posts#update'

  # Deletes existing post based on ID
  delete '/posts/:id', to: 'posts#destroy', as: 'destroy_post'
  
  # Send get request to ESP8266 to turn LED on and off
  get "/led/on", to: "posts#ledOn", as: "led_on"
  get "/led/off", to: "posts#ledOff", as: "led_off"


end
