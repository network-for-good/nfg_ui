module NfgUi
  # The parent component module for design system components (excluding bootstrap framework)
  module Components
    extend ActiveSupport::Autoload

    autoload :Base
    autoload :Elements
    autoload :Foundations
    autoload :Patterns
    autoload :Utilities
    autoload :Traits
  end
end
