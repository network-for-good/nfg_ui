module NfgUi
  module Components
    module Utilities
      # Allows components to be setup to utilize disable_with
      module DisableWithable
        def data
          disable_with ? super.merge!(disable_with: disable_with) : super
        end

        def disable_with
          options.fetch(:disable_with, nil)
        end

        private

        def default_disable_with
          @default_disable_with ||= view_context.ui.nfg(:icon, :loader, text: 'Saving')
        end

        def non_html_attribute_options
          super.push(:disable_with)
        end
      end
    end
  end
end
