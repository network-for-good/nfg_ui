module NfgUi
  module Bootstrap
    p ":::::: #{__FILE__.split('/').last.to_s} :::::: #{__FILE__} :::::: Loaded"
    extend ActiveSupport::Autoload

    autoload :Components
    autoload :Utilities
  end
end
