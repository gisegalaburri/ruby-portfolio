Rails.application.routes.draw do
  # this is for authentication
  # in path_names are custom routes
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  # resources -> used for any kind of CRUD 
  # custom routes for resources
  # as: is my own custom route method
  resources :portfolios, except: [:show]
  get 'angular-items', to: 'portfolios#angular'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  #generated by default rails g controller Pages home about contact
  # get 'pages/home'
  # get 'pages/about'

  # mapping whith the controller before the # and then action 
  # the get 'something' can be customized as I want
  get 'about-me', to: 'pages#about'
  
  #get 'pages/contact'

  get 'contact', to: 'pages#contact'

  # resources -> reserved word -> encapsulates all the popular routes that the app use. -> restful routing -> means especific and standardized names for our routes -> resources contains all the routes
  resources :blogs do
    member do
      # this created a new route: toggle_status_blog
      get :toggle_status
    end
  end
  
  # the root path
  root to: 'pages#home'
end
