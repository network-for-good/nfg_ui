Rails.application.routes.draw do
  mount NfgUi::Engine => '/nfg_ui'
  root 'alerts#index'

  resources :alerts, only: [:index]
end
