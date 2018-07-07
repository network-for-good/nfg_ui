module NfgUi
  # Top-level user interface components namespace manager
  # Provides the ability to swap between namespaces at will
  # Ex.: ui.nfg ... and ui.bootstrap
  module UI
    extend ActiveSupport::Autoload

    autoload :Base
    autoload :Bootstrap
    autoload :NetworkForGood
    autoload :Utilities
  end
end
