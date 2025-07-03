Rails.application.routes.draw do
  resources :appointments
  resources :professionals
  resources :customers
  get "up" => "rails/health#show", as: :rails_health_check
end
