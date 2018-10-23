# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Navbar Component
      # https://getbootstrap.com/docs/4.1/components/navbar/
      class Navbar < Bootstrap::Components::Base
        include Bootstrap::Utilities::Wrappable
        include Bootstrap::Utilities::Themeable

        def component_family
          :navbar
        end

        def expand
          options.fetch(:expand, :lg)
        end

        def light
          options.fetch(:light, nil)
        end

        def dark
          options.fetch(:dark, nil)
        end

        def sticky
          options.fetch(:sticky, nil)
        end

        def fixed
          options.fetch(:fixed, nil)
        end

        private

        def css_classes
          [
            super,
            ("#{component_css_class}-expand-#{expand}" unless expand.nil?),
            dark_or_light_navbar_css_class,
            ('sticky-top' if sticky == :top),
            ('fixed-bottom' if fixed == :bottom),
            ('fixed-top' if fixed == :top),
          ].join(' ').squish
        end

        def assistive_html_attributes
          as == :nav ? super : super.merge!(role: 'navigation')
        end

        def default_html_wrapper_element
          :nav
        end

        def theme_css_class_prefix
          'bg-'
        end

        def dark_or_light_navbar_css_class
          if dark
            'navbar-dark'
          elsif light
            'navbar-light'
          else
            dark_themes = %i[primary secondary success danger warning info dark]
            dark_themes.include?(theme) ? 'navbar-dark' : 'navbar-light'
          end
        end

        def default_theme
          :light
        end

        def non_html_attribute_options
          super.push(:dark,
                     :expand,
                     :right,
                     :left,
                     :light)
        end
      end
    end
  end
end
