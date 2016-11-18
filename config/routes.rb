Rails.application.routes.draw do
  root 'foodspots#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  resources :users, :only => [:show]
  resources :foodspots do
    member do
      put "like" => "foodspots#upvote"
      put "unlike"  => "foodspots#downvote"
    end
    collection do
      get 'search'  => "foodspots#search"
      get 'popular'  => "foodspots#popular"
    end
  end
match '/nearme', to: 'foodspots#near', via: :get
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
