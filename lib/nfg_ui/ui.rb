# frozen_string_literal: true

module NfgUi
  # Top-level user interface components namespace manager
  # Provides the ability to swap between namespaces at will
  # Ex.: ui.nfg ... and ui.bootstrap
  module UI
    require_relative 'ui/base'
    require_relative 'ui/bootstrap'
    require_relative 'ui/network_for_good'
  end
end
