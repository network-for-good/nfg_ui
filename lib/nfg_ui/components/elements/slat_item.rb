# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Slat doc coming soon
      class SlatItem < NfgUi::Components::Base
        include Bootstrap::Utilities::Headable
        include Bootstrap::Utilities::Sizable

        include NfgUi::Components::Traits::Size

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

        def css_classes
          [
            super,
            ('text-word-wrap' if size == :lg)
          ]
        end

        def non_html_attribute_options
          super.push(:slat_header, :caption)
        end
      end
    end
  end
end
