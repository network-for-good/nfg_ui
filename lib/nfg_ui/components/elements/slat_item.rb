# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Slat doc coming soon
      class SlatItem < NfgUi::Components::Base
        include Bootstrap::Utilities::Headable

        def component_family
          :slats
        end

        def slat_header
          options.fetch(:slat_header, nil)
        end

        def caption
          options.fetch(:caption, nil)
        end

        private

        def non_html_attribute_options
          super.push(:slat_header, :caption)
        end
      end
    end
  end
end
