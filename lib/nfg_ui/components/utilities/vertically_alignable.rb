module NfgUi
  module Components
    module Utilities
      module VerticallyAlignable
        # Can also pass in responsive variations
        # align_items: :sm_center
        def align_items
          options.fetch(:align_items, nil)
        end

        def align_self
          options.fetch(:align_self, nil)
        end

        private

        def css_classes
          [
            super,
            ("d-flex align-items-#{align_items.to_s.dasherize}" if align_items),
            ("d-flex align-self-#{align_self.to_s.dasherize}" if align_self)
          ].join(' ').squish
        end

        def non_html_attribute_options
          super.push(:align_items)
        end
      end
    end
  end
end
