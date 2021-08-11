Rails.application.routes.draw do
  resources :articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # this 'resources' keyword will create all the routes you need for the 'reports'
  # adding the 'only' will create routes for what is in the square brackets
  resources :reports, only: [:show, :index, :new, :create]

  # this is telling rails to expect a 'home' method(or action) in the pages_controller.rb class
  root 'pages#home'

  # this translates to a GET request to the ABOUT page
  get 'about', to: 'pages#about'
end
