Rails.application.routes.draw do
  post '/lookup', to: 'home#lookup'
  get "/lookup" => redirect("/")
  get "up" => "rails/health#show", as: :rails_health_check
  root 'home#index'
end
