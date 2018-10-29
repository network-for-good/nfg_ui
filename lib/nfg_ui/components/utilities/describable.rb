module NfgUi
  module Components
    module Utilities
      # Allows components to be setup to accept icons
      module Describable
        def describe
          options.fetch(:describe, nil)
        end

        def data
          describe ? super.merge!(describe: describe) : super
        end

        private

        def non_html_attribute_options
          super.push(:describe)
        end
      end
    end
  end
end
