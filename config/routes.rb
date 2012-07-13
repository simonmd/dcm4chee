Dcm4chee::Engine.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    scope module: :v1, constraints: Dcm4chee::ApiConstraints.new(version: 1, default: true) do
      resources :patients, only: [:index, :create]
      resources :studies, only: [:index, :create]
      resources :series, only: [:index, :create]
      resources :instances, only: [:index, :create]

      resources :trashed_patients, only: [:index, :create, :destroy]
      resources :trashed_studies, only: [:index, :create, :destroy]
      resources :trashed_series, only: [:index, :create, :destroy]
      resources :trashed_instances, only: [:index, :create, :destroy]

      resources :file_systems, only: :index

      resource  :trash, only: :destroy

      resources :application_entities, only: [:create, :update]
    end
  end
end
