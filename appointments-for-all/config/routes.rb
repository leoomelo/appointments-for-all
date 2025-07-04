Rails.application.routes.draw do
  resources :appointments
  
  resources :professionals do
    resources :appointments, only: [:index], to: 'appointments#by_professional', as: 'professional_appointments'
  end
  
  resources :customers
  get "up" => "rails/health#show", as: :rails_health_check
end
