# frozen_string_literal: true

module NfgUi
  module Components
    module Utilities
      # Allows NFG design system components to utilize the :title option
      module Titleable
        attr_reader :title

        def initialize(*)
          super
          @title = options.fetch(:title, default_title)
        end

        private

        def default_title
          ''
        end

        def defaults
          super.merge!(title: '')
        end

        def non_html_attribute_options
          super.push(:title)
        end
      end
    end
  end
end
