# frozen_string_literal: true

module NfgUi
  module Bootstrap
    # Manifest for Bootstrap utility modules
    module Utilities
      extend ActiveSupport::Autoload
      p "AUTOLOADING BOOTSTRAP::UTILITIES::ACTIVATABLE"
      autoload :Activatable
      p "AUTOLOADING BOOTSTRAP::UTILITIES::ARIAASSISTABLE"
      autoload :AriaAssistable
      p "AUTOLOADING BOOTSTRAP::UTILITIES::COLLAPSIBLE"
      autoload :Collapsible
      p "AUTOLOADING BOOTSTRAP::UTILITIES::DISABLEABLE"
      autoload :Disableable
      p "AUTOLOADING BOOTSTRAP::UTILITIES::DISMISSIBLE"
      autoload :Dismissible
      p "AUTOLOADING BOOTSTRAP::UTILITIES::SIZABLE"
      autoload :Sizable
      p "AUTOLOADING BOOTSTRAP::UTILITIES::THEMEABLE"
      autoload :Themeable
      p "AUTOLOADING BOOTSTRAP::UTILITIES::TOOLTIPABLE"
      autoload :Tooltipable
      p "AUTOLOADING BOOTSTRAP::UTILITIES::WRAPPABLE"
      autoload :Wrappable
    end
  end
end
