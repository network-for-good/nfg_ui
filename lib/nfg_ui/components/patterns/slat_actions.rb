# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # Slat doc coming soon
      class SlatActions < NfgUi::Components::Base
        def component_family
          :slats
        end

        def slat_header
          options.fetch(:slat_header, false)
        end

        def wide
          options.fetch(:wide, true)
        end

        private

        def non_html_attribute_options
          super.push(:slat_header, :wide)
        end
      end
    end
  end
end
