# frozen_string_literal: true

module NfgUi
  module Components
    module Utilities
      # Allows NFG design system components to utilize the :title option
      module Titleable
        attr_accessor :title

        def initialize(*)
          super
          self.title = options.fetch(:title, default_title)
        end

        private

        def default_title
          ''
        end

        def defaults
          super.merge!(title: '')
        end
      end
    end
  end
end
