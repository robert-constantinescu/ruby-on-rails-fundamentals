Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # this is telling rails to expect a 'home' method(or action) in the pages_controller.rb class
  root 'pages#home'

  # this translates to a GET request to the ABOUT page
  get 'about', to: 'pages#about'
end
