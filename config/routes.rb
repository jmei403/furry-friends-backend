Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users
      resources :likes
      resources :pets
      get '/petfinder', to: 'petfinder#index'
      get '/petfinder/:id', to: 'petfinder#pet_details'
      get '/:type', to: 'petfinder#get_type'
    end
   end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
