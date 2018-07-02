Rails.application.routes.draw do
  mount NfgUi::Engine => '/nfg_ui'
  root 'dashboard#index'
  resources :dashboard, only: [:index]

  resources :alerts, only: [:index]
  resources :badges, only: [:index]
end
