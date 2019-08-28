Rails.application.routes.draw do
  mount NfgUi::Engine => '/nfg_ui'
  root 'dashboard#index'
  resources :dashboard, only: [:index]

  namespace :bootstrap do
    NfgUi::BOOTSTRAP_COMPONENT_NAMES.each do |resource|
      resources resource.to_s.pluralize.to_sym, only: [:index]
    end
    get 'tabs', to: 'tabs#index', as: 'tabs'
  end

  namespace :elements do
    NfgUi::ELEMENT_COMPONENT_NAMES.each do |resource|
      resources resource.to_s.pluralize.to_sym, only: [:index]
    end
  end

  namespace :foundations do
    NfgUi::FOUNDATION_COMPONENT_NAMES.each do |resource|
      resources resource.to_s.pluralize.to_sym, only: [:index]
    end
  end

  namespace :patterns do
    NfgUi::PATTERN_COMPONENT_NAMES.each do |resource|
      next if resource == :slat
      resources resource.to_s.pluralize.to_sym, only: [:index]
    end
    get 'tabs', to: 'tabs#index', as: 'tabs'
  end

  resource :feature_spec_views do
    get :modal
    get :tooltip
  end

  resource :javascript_plugins, only: [] do
    get :datetimepicker
  end
end
