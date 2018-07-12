# frozen_string_literal: true

module NfgUi
  module Components
    # Centralizes and autoloads traits for design system components
    # Trait modules must have the same name as the component they represent.
    # This provides autoloading of traits.
    module Traits
      extend ActiveSupport::Autoload

      autoload :Typeface
    end
  end
end
