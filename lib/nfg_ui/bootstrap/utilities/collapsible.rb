# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Utilities
      # Allows components to carry collapse attributes
      # to more easily pass collapse status to a collapsible target
      #
      # Example:
      # Tile & TileHeader both include Collapsible
      # because they both pass collapse attributes to
      # a collapse button within TileHeader
      #
      # They do not, however need a collapse toggle
      # unlike a NavbarToggle / Button, and thus they do not include
      # The CollapseToggleable module
      #
      # CollapseToggleable components have this module included
      # by default via the CollapseToggleable module.
      module Collapsible
        def collapse
          options.fetch(:collapse, nil)
        end

        def collapsed
          options.fetch(:collapsed, nil)
        end

        # Collapsible checks if collapse is manually set true or false and thus, collapsible
        def collapsible
          options[:collapsible] || collapse || !collapsed.nil?
        end

        private

        def non_html_attribute_options
          super.push(:collapse, :collapsed, :collapsible)
        end
      end
    end
  end
end
