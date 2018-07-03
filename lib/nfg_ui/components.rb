module NfgUi
  # The parent component module for design system components (excluding bootstrap framework)
  module Components
    include NfgUi::Utilities::Groupings
    include NfgUi::Utilities::PartialPath

    extend ActiveSupport::Autoload

    autoload :Foundations
    autoload :Elements
    autoload :Patterns
  end
end
