Rails.application.routes.draw do
  root "games#index"
  resources :games
  resources :users, except: [:index]

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"

  patch "/players/status" => "players#status", as: "status"

  post 'twilio/voice' => 'twilio#voice'
  get 'notifications/notify' => 'notifications#notify'
end
