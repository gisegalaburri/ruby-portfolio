Rails.application.routes.draw do
  # resources -> reserved word -> encapsulates all the popular routes that the app use. -> restful routing -> means especific and standardized names for our routes -> resources contains all the routes
  resources :blogs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
