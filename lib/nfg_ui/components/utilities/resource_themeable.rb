# frozen_string_literal: true

module NfgUi
  module Components
    module Utilities
      # The library of dedicated theme resources in Evo & DMS
      module ResourceThemeable
        FALLBACK_ICON = 'heart-o'
        DEFAULT_THEME_COLOR = 'primary'
        # This method represents an existential question
        # for the UX team at NFG
        #
        # For now, we are defaulting everything to primary
        # However, the structure is in place to facilitate
        # resource specific theming ala Donor Management.
        def resource_theme_color(object = nil)
          case resource_theme_name(object)
          when 'Project'
            DEFAULT_THEME_COLOR
          when 'Campaign'
            DEFAULT_THEME_COLOR
          else
            DEFAULT_THEME_COLOR
          end
        end

        def resource_theme_icon(object = nil)
          case resource_theme_name(object)
          when 'Newsletter'
            'at'
          when 'Report'
            'bar-chart'
          when 'Campaign', 'Project', 'Cause', 'Event'
            'bullhorn'
          when 'Entity'
            'cog'
          when 'PaymentGatewayProfile'
            'credit-card'
          when 'Donation', 'Order'
            'dollar'
          when 'CustomContent', 'SiteContent'
            'file-text-o'
          when 'Donor', 'Admin'
            'user'
          when 'Integration'
            'exchange'
          when 'RecurringDonation'
            'refresh'
          else
            FALLBACK_ICON
          end
        end

        def resource_theme_name(object = nil)
          # If an object is included:
          if object.present?
            if object.is_a?(String)
              object
            elsif object.is_a?(Class)
              object.name
            elsif object.is_a?(Symbol)
              object.to_s.classify
            else
              object.class.name
            end

          # If this method was called from a view as a normal helper method,
          # check for controller_name
          elsif defined?(controller_name)
            formatted_controller_name(controller_name)

          # If this method was called from within a design system component
          # then seek the defined view_context
          elsif defined?(view_context)
            formatted_controller_name(view_context.controller_name)

          # If nothing responds, return an empty string
          else
            ''
          end
        end

        private

        # Centralizes how we format the controller name for interpretation in our cases
        def formatted_controller_name(controller_name_string)
          return unless controller_name_string
          controller_name_string.split('/').last.classify
        end
      end
    end
  end
end
