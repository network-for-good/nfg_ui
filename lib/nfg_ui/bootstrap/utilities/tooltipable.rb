# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Utilities
      # Tooltip doc coming soon
      #
      # Bootstrap documentation
      # https://getbootstrap.com/docs/4.1/components/tooltips/
      #
      # Allows tooltips to be placed on any component's main wrapping element
      #
      # When tooltip is applied to a disabled component (via the tooltip argument)
      # the component will return the necessary information to build a wrapper div
      # due to the non-interactable nature of the disabled elements.
      #
      # Example implementation of a button in HAML:
      #
      # - if button.disabled_tooltipable?
      #   %span{ button.disabled_component_tooltip_wrapper_html_options }
      #     = content_tag button.html_wrapper_element, button.html_options do
      #       = button.body

      # - else
      #   = content_tag button.html_wrapper_element, button.html_options do
      #     = button.body
      #
      # Tooltip placement:
      # You can override the placement if needed by setting the tooltip_placement method
      # in your target class -- :top, :bottom, :left, :right
      #
      # Example:
      #
      # def tooltip_placement
      #   :right
      # end
      module Tooltipable
        # TODO: This include should be removed and then anything with Tooltipable
        # needs to be evaluated that this doesn't break it.
        # It is undesirable that every Tooltipable component also received
        # the disableable functionality as well.
        include Bootstrap::Utilities::Disableable
        
        def tooltip
          options.fetch(:tooltip, nil)
        end

        # There are a number of complex changes that need to be made to the html
        # for disabled tooltipped buttons
        # Read more:
        #
        # https://getbootstrap.com/docs/4.1/components/tooltips/#disabled-elements
        def html_options
          return super if options[:tooltip].nil?

          component_title = disabled ? options.fetch(:title, nil) : tooltip
          # raise component_title.inspect
          component_styles = (options[:style] || '') + (disabled ? ' pointer-events: none;' : '') if disabled
          component_tabindex = nil if disabled
          # raise options.inspect
          # component_data = disabled ? {} : (options[:data] || {}).merge!(tooltip_data_attributes)
          # tooltip_data_attributes unless disabled || options[:data].try(:toggle)
          super.merge!(title: component_title,
                       style: component_styles.try(:squish),
                       tabindex: component_tabindex)

          
          # raise super.fetch(:data).inspect
          # super
        end

        def data
          if tooltip
            disabled ? super : super.merge!(tooltip_data_attributes)
          else
            super
          end
        end

        def disabled_component_tooltip_wrapper_html_options
          { data: tooltip_data_attributes,
            title: tooltip,
            class: 'd-inline-block',
            tabindex: '0' }
        end

        private

        def tooltip_data_attributes
          { toggle: 'tooltip',
            placement: tooltip_placement,
            html: 'true'}
        end

        def non_html_attribute_options
          super.push(:tooltip)
        end

        def tooltip_placement
          @tooltip_placement ||= :top
        end
      end
    end
  end
end
