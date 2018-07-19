# frozen_string_literal: true

module NfgUi
  module Components
    # Centralizes and autoloads traits for design system components
    # Trait modules must have the same name as the component they represent.
    # This provides autoloading of traits.
    module Traits
      extend ActiveSupport::Autoload
      p "AUTOLOADING TRAITS::ALERT"
      autoload :Alert
      p "AUTOLOADING TRAITS::BUTTON"
      autoload :Button
      p "AUTOLOADING TRAITS::CARD"
      autoload :Card
      p "AUTOLOADING TRAITS::ICON"
      autoload :Icon
      p "AUTOLOADING TRAITS::PAGEHEADER"
      autoload :PageHeader
      p "AUTOLOADING TRAITS::THEME"
      autoload :Theme
      p "AUTOLOADING TRAITS::TYPEFACE"
      autoload :Typeface
    end
  end
end
