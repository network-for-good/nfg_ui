# frozen_string_literal: true

module NfgUi
  module Components
    module Utilities
      # The library of dedicated theme resources in Evo & DMS
      module ResourceThemeable
        # This method represents an existential question
        # for the UX team at NFG
        #
        # For now, we are defaulting everything to primary
        # However, the structure is in place to facilitate
        # resource specific theming ala Donor Management.
        def resource_theme_color(object = nil)
          case resource_theme_name(object)
          when 'Project'
            'primary'
          when 'Campaign'
            'primary'
          else
            'primary'
          end
        end

        def resource_theme_icon(object = nil)
          case resource_theme_name(object)
          when 'Project'
            'bullhorn'
          when 'Campaign'
            'bullhorn'
          else
            'heart-o'
          end
        end

        def resource_theme_name(object = nil)
          if object.present?
            if object.is_a?(String)
              object
            elsif object.is_a?(Class)
              object.name
            else
              object.class.name
            end
          else
            view_context.controller_name.split('/').last.classify
          end
        end
      end
    end
  end
end
