Rails.application.routes.draw do
  get 'dashboard/show'
  root 'registrations#new'
  resources :registrations, only: [:new, :create]
  get 'dashboard', to: 'dashboard#show'
  get 'registrations/create'
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check
end
