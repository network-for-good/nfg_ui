# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Card Component
      # https://getbootstrap.com/docs/4.1/components/cards/

      # TODO: review card customization and implement, including footer
      class Card < Bootstrap::Components::Base
        include Bootstrap::Utilities::Themeable
        # attr_reader :theme
        # attr_reader :subtitle
        # attr_writer :options

        # def initialize(*)
        #   super
        #   @subtitle = options.fetch(:subtitle, '')
        #   self.options = defaults.merge!(**defaults_for_subtitle, **options) if subtitle.present?
        # end

        # def card_title_element
        #   :h5
        # end

        # def card_subtitle_element
        #   :h6
        # end

        def heading
          p "====== Printed from: (Bootstrap::Components::Card) self.class.name: #{self.class.name} method: #{__method__}"
          options.fetch(:heading, '')
        end

        def title
          p "====== Printed from: (Bootstrap::Components::Card) self.class.name: #{self.class.name} method: #{__method__}"
          options.fetch(:title, '')
        end

        def subtitle
          p "====== Printed from: (Bootstrap::Components::Card) self.class.name: #{self.class.name} method: #{__method__}"
          options.fetch(:subtitle, '')
        end

        def footer
          p "====== Printed from: (Bootstrap::Components::Card) self.class.name: #{self.class.name} method: #{__method__}"
          options.fetch(:footer, '')
        end

        def component_family
          p "====== Printed from: (Bootstrap::Components::Card) self.class.name: #{self.class.name} method: #{__method__}"
          :card
        end

        private


        

        # def card_theme_text_css_class
        #   if outlined
        #     "text-#{theme}" unless theme == :light
        #   elsif theme != :light
        #     'text-white'
        #   else
        #     ''
        #   end
        # end

        # def defaults_for_subtitle
        #   { subtitle: '' }
        # end

        def css_classes
          return super unless theme.presence && theme != :light
          super + " #{(outlined ? "text-#{theme}" : 'text-white')}"
        end

        def default_theme
          nil
        end

        def non_html_attribute_options
          p "====== Printed from: (Bootstrap::Components::Card) self.class.name: #{self.class.name} method: #{__method__}"
          super.push(:footer, :heading, :subtitle, :title)
        end

        def outlined_css_class_prefix
          'border-'
        end

        def theme_css_class_prefix
          outlined ? '' : 'bg-'
        end

        # def outline_css_class_string
        #   'border-' if outlined
        # end

        # def theme_css_class
        #   if theme.present?
        #     if outlined
        #       "#{outline_css_class_string}#{theme} #{card_theme_text_css_class}"
        #     else
        #       super + " #{card_theme_text_css_class}"
        #     end
        #   else
        #     super
        #   end
        # end

        # def theme_css_class_prefix
        #   'bg'
        # end
      end
    end
  end
end
