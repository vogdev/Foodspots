Rails.application.routes.draw do
  devise_for :users
  resources :users, :only => [:show]
resources :foodspots do
  member do
    put "like" => "foodspots#upvote"
    put "unlike" => "foodspots#downvote"
  end
end
root 'foodspots#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
