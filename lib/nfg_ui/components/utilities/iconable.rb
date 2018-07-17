# frozen_string_literal: true

module NfgUi
  module Components
    module Utilities
      # Allows components to be setup to accept icons
      module Iconable
        attr_reader :text, :icon

        def initialize(*)
          super
          @text = options.fetch(:text, options[:body])
          @icon = options.fetch(:icon, default_icon)
        end

        def icon?
          icon.present?
        end

        private

        def default_icon
          ''
        end

        def defaults
          super.merge!(icon: default_icon)
        end

        def non_html_attribute_options
          super.push(:icon)
        end

        def text_maybe_with_icon
          icon? ? view_context.ui.nfg(:icon, icon, class: 'mr-1', text: text) : text
        end
      end
    end
  end
end
