Rails.application.routes.draw do
resources :foodspots
root 'foodspots#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
