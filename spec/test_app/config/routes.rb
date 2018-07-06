Rails.application.routes.draw do
  mount NfgUi::Engine => '/nfg_ui'
  root 'dashboard#index'
  resources :dashboard, only: [:index]

  namespace :bootstrap do
    resources :alerts, only: [:index]
    resources :badges, only: [:index]
    resources :breadcrumbs, only: [:index]
    resources :buttons, only: [:index]
    resources :button_groups, only: [:index]
    resources :cards, only: [:index]
    resources :carousels, only: [:index]
    resources :dropdowns, only: [:index]
    resources :forms, only: [:index]
    resources :jumbotrons, only: [:index]
    resources :list_groups, only: [:index]
    resources :modals, only: [:index]
    resources :navbars, only: [:index]
    resources :navs, only: [:index]
    resources :paginations, only: [:index]
    resources :popovers, only: [:index]
    resources :progresses, only: [:index]
    resources :tooltips, only: [:index]
  end
end
