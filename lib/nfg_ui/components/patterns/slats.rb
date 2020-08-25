# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # Main slats
      class Slats < NfgUi::Components::Base
        include Bootstrap::Utilities::Sizable

        include NfgUi::Components::Traits::Size
        include NfgUi::Components::Traits::Slats

        def component_family
          :slats
        end

        # When :nowrap is true,
        # the slat-item columns will not break into rows
        # regardless of responsive page width
        #
        # When false / not present
        # slat item columns will break down into rows as expected in conventional
        # responsivel webpage design.
        def nowrap
          options.fetch(:nowrap, false)
        end

        # Determine whether or not to accomodate a specific
        # SlatActions size configuration
        # by default, when slat_actions is not set
        # it should have a nil presence
        #
        # Note:
        # `nil` is different from the :none keyword
        #
        # Options:
        # :sm - account for a small SlatAction (icon only)
        # :lg - account for a large SlatAction (Text & Icon)
        # :none - Do not account for a SlatAction
        #
        # Leaving `nil` for slat_actions will kick off
        # default behavior for the Slats' SlatAction
        # which is a combination of :lg (for large screen)
        # and :sm for small screen (where the slat action flexes)
        # across screen sizes hiding and showing its text
        def slat_actions
          options[:slat_actions] || nil
        end

        private

        def css_classes
          [
            super,
            ("#{component_css_class}-nowrap" if nowrap),
            ("slat-actions-#{slat_actions}" if slat_actions_resized?)
          ].join(' ').squish
        end

        # Only acceptable keywords are:
        # :sm, :lg, and :none
        # all other slat_action keywords are ignored
        def slat_actions_resized?
          [:sm, :lg, :none].include?(slat_actions)
        end

        def non_html_attribute_options
          super.push(:slat_actions, :nowrap)
        end

      end
    end
  end
end
