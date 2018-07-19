# frozen_string_literal: true

module NfgUi
  module Components
    # Autoloads utilities unique for NFG design system components
    module Utilities
      require_relative 'utilities/browser_detectable'
      require_relative 'utilities/iconable'
      require_relative 'utilities/titleable'
      require_relative 'utilities/resource_themeable'
      require_relative 'utilities/requireable'
    end
  end
end
