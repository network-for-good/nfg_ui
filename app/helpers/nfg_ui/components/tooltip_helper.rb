module NfgUi
  module Components
    module TooltipHelper
      def tooltip(tooltip_content, placement = :top, data = {})
        # IMPORTANT NOTE: This must be included as the first argument within your element.
        # Working Example: # %span{ bootstrap_tooltip(t(".tooltips.group_name"), :top), class: "my-class" }

        acceptable_placement_directions = %i[right top bottom left]

        raise StandardError.new("Acceptable placement options are :right, :top, :bottom or :left, only... and you assigned #{placement}") unless acceptable_placement_directions.include?(placement)

        if browser_is_a_touch_device?
          {}
        else
          { title: tooltip_content, data: data.merge(placement: placement, toggle: "tooltip", html: 'true') }
        end
      end

      def browser_is_a_touch_device?
        browser.mobile? || browser.tablet?
      end
    end
  end
end
