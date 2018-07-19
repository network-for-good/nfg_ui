# frozen_string_literal: true

module NfgUi
  module Components
    # Autoloads utilities unique for NFG design system components
    module Utilities
      extend ActiveSupport::Autoload

      p "AUTOLOADING UTILITIES::BROWSERDETECTABLE"
      autoload :BrowserDetectable
      p "AUTOLOADING UTILITIES::ICONABLE"
      autoload :Iconable
      p "AUTOLOADING UTILITIES::TITLEABLE"
      autoload :Titleable
      p "AUTOLOADING UTILITIES::RESOURCETHEMEABLE"
      autoload :ResourceThemeable
      p "AUTOLOADING UTILITIES::REQUIREABLE"
      autoload :Requireable
    end
  end
end
