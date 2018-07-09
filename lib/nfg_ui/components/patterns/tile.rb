# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # Tile doc coming soon
      class Tile < Bootstrap::Components::Base
        attr_reader :icon, :title

        def initialize(*)
          super
          @title = options.fetch(:title, '')
          @icon = options.fetch(:icon, '')
        end

        # Optionally auto-load a footer by passing it in
        # ex: = ui.nfg :tile, body: 'Example', footer: 'Example footer'
        def footer
          options[:footer].presence
        end

        private

        def defaults
          super.merge!(icon: 'circle-o',
                       title: '')
        end

        def component_family
          :tile
        end

        def non_html_attribute_options
          super.push(:icon, :title, (:footer if footer))
        end
      end
    end
  end
end
