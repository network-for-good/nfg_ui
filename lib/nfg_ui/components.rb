module NfgUi
  module Components
    p ":::::: #{__FILE__.split('/').last.to_s} :::::: #{__FILE__} :::::: Loaded"

    extend ActiveSupport::Autoload

    autoload :Foundations
    autoload :Elements
    autoload :Patterns
  end
end
