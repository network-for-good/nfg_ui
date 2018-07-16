module NfgUi
  module Components
    module Utilities
      # The library of dedicated theme resources in Evo & DMS
      module ResourceThemeable
        attr_reader :view_context

        def resource_theme_color(object = nil)
          resource_theme_name = resource_theme_name(object)
          case resource_theme_name
          when 'Project'
            'primary'
          when 'Campaign'
            'success'
          else
            'primary'
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
            params[:controller].split('/').last.classify
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
      end
    end
  end
end
