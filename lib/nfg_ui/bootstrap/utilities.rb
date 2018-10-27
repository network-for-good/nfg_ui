# frozen_string_literal: true

module NfgUi
  module Bootstrap
    # Manifest for Bootstrap utility modules
    module Utilities
      extend ActiveSupport::Autoload
      autoload :Activatable
      autoload :Alignable
      autoload :Collapsible
      autoload :CollapseToggleable
      autoload :Disableable
      autoload :Dismissible
      autoload :DropdownDirectionable
      autoload :Sizable
      autoload :Themeable
      autoload :Tooltipable
      autoload :Wrappable
    end
  end
end
