Rails.application.routes.draw do
  devise_scope :user do
    root to: "users/sessions#new"
  end

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    confirmations: "users/confirmations",
    passwords: "users/passwords"
  }

  namespace :admin do
    get "/", to: "home#index", as: "home"
    resources :properties, expect: %i[create index update destroy new edit show]
    resources :collaborators, expect: %i[create index destroy new show]
    resources :property_accesses, only: [:new, :create, :destroy]
    resources :module_properties, only: [:new, :create, :destroy]
    resources :production_modules, only: [:new, :create, :destroy, :index, :show]
  end

  # Rota de verificação de saúde
  get "up" => "rails/health#show", :as => :rails_health_check

  # Rota para PWA
  get "service-worker" => "rails/pwa#service_worker", :as => :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", :as => :pwa_manifest
end
