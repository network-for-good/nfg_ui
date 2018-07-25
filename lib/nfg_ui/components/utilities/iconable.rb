# frozen_string_literal: true

module NfgUi
  module Components
    module Utilities
      # Allows components to be setup to accept icons
      module Iconable
        def icon
          @icon ||= options.fetch(:icon, nil)
        end

        def text
          @text ||= options[:body]
        end

        private

        def defaults
          super.merge!(icon: nil)
        end

        def non_html_attribute_options
          super.push(:icon)
        end

        def text_maybe_with_icon
          icon.present? ? view_context.ui.nfg(:icon, icon, class: 'mr-1', text: text) : @body
        end
      end
    end
  end
end
