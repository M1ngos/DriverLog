Rails.application.routes.draw do
  get "admin_dashboard/index"
  # Public homepage
  root "public#home"

  # Devise routes
  devise_for :admins, controllers: {
    sessions: "admins/sessions"
  }

  devise_for :drivers, controllers: {
    sessions: "drivers/sessions"
  }

  # Dashboard routes
  authenticate :admin do
    get "admin_dashboard", to: "admin_dashboard#index", as: :admin_dashboard
  end

  authenticate :driver do
    get "driver_dashboard", to: "driver_dashboard#index", as: :driver_dashboard
  end

  # Namespace for admin routes
  namespace :admin do
    get "dashboard", to: "dashboard#index"
    resources :clients
    resources :drivers
    resources :tasks
  end

  # Namespace for driver routes
  namespace :drivers do
    resources :tasks, only: [ :index, :show ]
  end

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA routes
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
