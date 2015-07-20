Rails.application.routes.draw do
  root "games#index"
  resources :games
  resources :users, except: [:index]

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"

  patch "/players/:id/status" => "players#status", as: "status"
end
