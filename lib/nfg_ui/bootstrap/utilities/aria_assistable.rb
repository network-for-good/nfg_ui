# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Utilities
      # Simplifies the process of integrating aria's into components
      # accounting for manual overrides and/or set-it-and-forget-it
      # by using the default bootstrap aria attributes.
      module AriaAssistable
        attr_accessor :aria

        def initialize(*)
          super
          self.aria = options.fetch(:aria, {})
        end

        def build_aria(aria_key:, aria_value:)
          aria_key = aria_key
          aria_value = aria_value

          aria_assistive_html_attributes.merge!(aria_key => aria_assistive_html_attributes.fetch(aria_key, aria_value))
        end

        def assistive_html_attributes
          aria_assistive_html_attributes.present? ? super.merge!(aria: aria_assistive_html_attributes) : super
        end

        def aria_assistive_html_attributes
          aria
        end
      end
    end
  end
end
