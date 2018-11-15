# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Utilities
      # Allows components to have a collapsed state when appropriate
      module CollapseToggleable
        include Bootstrap::Utilities::Collapsible

        def data
          collapse ? super.merge!(collapse_data_attributes) : super
        end

        private

        # Buttons need to be able to to set a target on :buttons
        # and an href on links -- so this attribute is customizable if needed
        def collapse_data_attributes
          @collapse_data_attributes ||= { toggle: 'collapse', target: collapse }
        end

        # To do: currently collapsible doesn't control the actual collapse
        # As such, there's no way to set aria-expanded on the button / toggle...
        # based on whether or not the collapse component is expanded or not
        #
        # To solve: how to address aria-expanded to accurately reflect the expanded status
        def assistive_html_attributes
          return super unless collapse
          super.merge!(aria: (options[:aria] || {}).merge!(expanded: 'false', controls: collapse.tr('#','')),
                       role: 'button')
        end
      end
    end
  end
end
