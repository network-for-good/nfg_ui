# frozen_string_literal: true

module NfgUi
  module Components
    module Traits
      # Access to pre-designed theme traits
      module Theme
        include Bootstrap::Utilities::Themeable

        attr_writer :theme

        def initialize(*)
          super
          self.theme = (bootstrap4_themes & traits).last || theme
        end
      end
    end
  end
end
