module NfgUi
  # The parent component module for design system components (excluding bootstrap framework)
  module Components
    # extend ActiveSupport::Autoload

    require_relative 'components/base'
    require_relative 'components/elements'
    require_relative 'components/foundations'
    require_relative 'components/patterns'
  end
end
