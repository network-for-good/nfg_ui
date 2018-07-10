# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # TileBody doc coming soon
      class TileBody < NfgUi::Components::Base
        include Bootstrap::Utilities::Collapsible
        
        attr_accessor :body

        def initialize(component_options, view_context)
          super
          self.body = collapsible_body
        end

        private

        def collapsible_body
          collapsible? ? tile_collapse_body_html : tile_body_html
        end

        def tile_collapse_body_html
          view_context.content_tag(:div,
                                   tile_body_html,
                                   id: collapsible_target_id,
                                   class: collapsible_target_css_classes)
        end

        def tile_body_html
          view_context.content_tag(:div,
                                   options[:body],
                                   html_options.merge!(id: tile_body_html_id))
        end

        def tile_body_html_id
          id unless collapsible?
        end

        def component_family
          :tile
        end
      end
    end
  end
end
