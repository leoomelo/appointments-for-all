Rails.application.routes.draw do
  mount MissionControl::Jobs::Engine, at: "/jobs"
  resources :appointments
  get "all_appointments" => "appointments#all_appointments"

  resources :professionals do
    resources :appointments, only: [ :index ], to: "appointments#by_professional", as: "professional_appointments"
  end

  resources :customers
  get "up" => "rails/health#show", as: :rails_health_check
  root "appointments#index"
end
