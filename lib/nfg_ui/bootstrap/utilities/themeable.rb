# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Utilities
      module Themeable
        
        attr_reader :theme

        def theme_html_class
          return unless theme.present? && bootstrap4_themes.include?(theme)
          [(component_html_class.present? ? component_html_class : default_html_class), theme].join('-') 
        end

        def bootstrap4_themes
          [:primary,
           :secondary,
           :success,
           :danger,
           :warning,
           :info,
           :light,
           :dark]
        end

        def default_theme
          :success
        end

        private

        def default_html_class
          self.class.name.to_s.split('::').last.dasherize.downcase
        end
      end
    end
  end
end
